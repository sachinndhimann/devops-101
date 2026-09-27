# Chapter 25 — Production Debugging

Ten realistic incidents, each worked through: Symptoms → Investigation →
Commands → Root Cause → Fix → Prevention. These deliberately reuse
concepts from every earlier chapter — this is the "final exam" chapter.

---

## Incident 1 — Container keeps restarting
**Symptoms:** `docker ps` shows the container cycling `Restarting`.
**Investigation:** `docker logs <id>` — usually shows the crash reason
immediately (unhandled exception, missing env var, failed to bind port).
**Commands:**
```bash
docker logs --tail 50 <id>
docker inspect <id> --format '{{.State.ExitCode}} {{.State.OOMKilled}}'
```
**Root cause (common):** missing required env var causes app to raise on
startup, or `--restart unless-stopped` combined with an immediate crash
loop.
**Fix:** supply the missing config (chapter17); remove `restart: always`
temporarily while debugging so it stops masking the crash with retries.
**Prevention:** fail loudly and specifically on missing config at startup
(`raise ValueError("DATABASE_URL is required")`, not a generic traceback
deep in request handling) — see `sample-app/app/config.py`.

---

## Incident 2 — Docker image suddenly became 1.5GB
**Symptoms:** CI build/push time doubled; registry storage costs jumped.
**Investigation:** `docker history --no-trunc <image>` on old vs new tag.
**Commands:**
```bash
docker history --no-trunc myapp:new | head -20
diff <(docker history myapp:old) <(docker history myapp:new)
```
**Root cause (common):** a dependency change pulled in a huge transitive
package, or someone accidentally reverted a multi-stage Dockerfile
(chapter8) back to single-stage during a "quick fix."
**Fix:** identify the offending layer from `docker history`, restore
multi-stage build / `.dockerignore` (chapter9).
**Prevention:** add an image-size check to CI (chapter13) that fails the
build if size exceeds a threshold, catching this before merge.

---

## Incident 3 — CI pipeline is slow
**Symptoms:** 15-minute CI runs where there used to be 3-minute ones.
**Investigation:** `--progress=plain` build output; per-job timing in the
Actions tab.
**Commands:**
```bash
docker build --progress=plain .
```
**Root cause (common):** dependency cache (`actions/cache`, chapter13)
stopped hitting — often because the cache key includes something that
changes every run (like a timestamp) instead of a lockfile hash.
**Fix:** fix the cache key to hash the actual lockfile
(`hashFiles('requirements.txt')`), not something incidental.
**Prevention:** review cache key changes in PR review specifically —
they're easy to silently break.

---

## Incident 4 — Secrets accidentally exposed
**Symptoms:** A secret value appears in a public log or committed file.
**Investigation:** confirm scope — was it a GitHub Actions secret (which
GitHub auto-redacts if referenced via `secrets.X`, chapter18) or a raw
value hardcoded and printed/committed?
**Commands:**
```bash
git log -p -- path/to/file | grep -i secret
```
**Root cause (common):** a secret was interpolated into a shell command
in a way GitHub's redaction couldn't detect (e.g. base64-encoded, or built
up from parts), or committed directly to source.
**Fix:** **Rotate the secret immediately** at its source system — removing
it from the file/log does not undo exposure to anyone who already saw it.
**Prevention:** never hardcode; enable secret scanning; never construct
secrets by concatenation in scripts (breaks redaction).

---

## Incident 5 — Deployment causes downtime
**Symptoms:** Users see 502s for ~30 seconds during every deploy.
**Investigation:** check deploy strategy (chapter19) and whether the load
balancer waits for `/ready` (chapter20/23) before routing traffic to new
instances.
**Commands:**
```bash
curl -w "%{http_code}\n" -o /dev/null -s http://<lb>/ready
```
**Root cause (common):** "Recreate" strategy being used for a
user-facing service, or a rolling deploy with no readiness gate — traffic
gets routed to instances before they're actually ready.
**Fix:** switch to rolling/blue-green (chapter19) and gate traffic on
`/ready`, not just "container started."
**Prevention:** treat zero-downtime requirements (chapter20) as a launch
checklist item for any new user-facing service, not an afterthought.

---

## Incident 6 — New container cannot connect to PostgreSQL
**Symptoms:** `/ready` returns 503, logs show connection refused/timeout
to the DB.
**Investigation:** is this a networking issue (chapter5) or a config issue
(chapter17)?
**Commands:**
```bash
docker exec <app-container> nslookup db
docker network inspect <network-name>
docker exec <app-container> env | grep DATABASE_URL
```
**Root cause (common):** app container isn't on the same Docker network
as the DB container (chapter5), or `DATABASE_URL` points at `localhost`
instead of the DB's service/container name — `localhost` inside a
container means the container itself, never another container.
**Fix:** put both on the same user-defined network / compose project;
correct the hostname in config.
**Prevention:** `/ready`'s explicit DB check (already in `sample-app`)
catches this immediately in any environment, rather than surfacing as a
mysterious 500 deep in request handling.

---

## Incident 7 — Health check fails
**Symptoms:** Orchestrator keeps killing/restarting an otherwise-working
container.
**Investigation:** is the healthcheck itself correct? Timeout too short?
Checking the wrong thing?
**Commands:**
```bash
docker inspect <id> --format '{{json .State.Health}}' | python3 -m json.tool
```
**Root cause (common):** `HEALTHCHECK` timeout (chapter4) too short for a
slow-starting app, or the healthcheck hits `/ready` (which depends on
external services) when it should hit `/health` (chapter23) — a slow
downstream DB shouldn't get the app container itself killed.
**Fix:** use the right probe for the right purpose (liveness vs readiness,
chapter23), and raise `--start-period` for slow-starting apps.
**Prevention:** always test healthcheck timing against realistic cold-start
time, not a warm local dev environment.

---

## Incident 8 — Container runs locally but fails in CI
**Symptoms:** `docker compose up` works on a laptop; the exact same image
fails a smoke test in the CI job.
**Investigation:** environment differences — architecture (arm64 laptop vs
amd64 CI runner), missing service container, or a hardcoded `localhost`
assumption.
**Commands:**
```bash
docker inspect <image> --format '{{.Architecture}}'
```
**Root cause (common):** dependency has a native extension only built for
one architecture (chapter9's alpine/musl gotcha, generalized), or the CI
job never spun up a Postgres/Redis service container (chapter13) that
local Compose provides for free.
**Fix:** add the missing service containers to the CI job; build/test
multi-arch if you support both.
**Prevention:** CI should mirror local Compose's dependency graph as
closely as possible — divergence here is a recurring source of "works on
my machine."

---

## Incident 9 — Production deployment passes CI but application fails
**Symptoms:** all CI gates green, but the app errors immediately in prod.
**Investigation:** what differs between CI's environment and prod's
(chapter17)? Config? Scale? Real data volume?
**Commands:**
```bash
diff <(env | sort) <(ssh prod-host env | sort)   # illustrative, adapt to your setup
```
**Root cause (common):** a production-only config value was never set
(chapter17/18), or a migration that ran cleanly on a small CI/staging DB
times out against production's real data volume.
**Fix:** align staging as closely as possible to prod's shape (data
volume, config sourcing) so this class of bug surfaces in staging instead.
**Prevention:** treat "staging passed" as a real gate (chapter16), not
theater — if staging never resembles prod, it can't catch prod-only bugs.

---

## Incident 10 — Rollback required
**Symptoms:** a bad deploy is confirmed (error rate spike correlated with
the deployment marker, chapter23) and must be reverted now.
**Investigation:** is this an application-only issue, or does it involve a
schema change (chapter20/21)?
**Commands:**
```bash
bash chapter21/examples/rollback.sh ghcr.io/<owner>/sample-app:<previous-sha>
```
**Root cause:** varies — this incident is about the *response*, not a
specific root cause.
**Fix:** roll back application immediately (fast path); assess DB state
separately and explicitly before assuming rollback alone fixes everything
(chapter21).
**Prevention:** rollback should be a rehearsed, one-command action, not
something improvised for the first time during an actual incident —
practice it in staging before you need it in production.

## Exercise
Pick any three incidents above and actually reproduce them against
`sample-app` (break something on purpose, then use the listed commands to
diagnose it) rather than just reading the walkthrough.
