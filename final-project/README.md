# final-project

The complete pipeline from chapters 1-25, assembled and pointed at one
real service: this repo copy of `sample-app`.

## What is wired up
- `Dockerfile` — multi-stage, non-root (chapter8/10)
- `docker-compose.yml` — app + Postgres + Redis, health-gated startup (chapter7)
- `.github/workflows/ci.yml` — lint -> test (with real Postgres/Redis service
  containers) -> build -> scan -> push, SHA-tagged (chapter13/14/22)
- `.github/workflows/cd.yml` — staging auto-deploy -> health check ->
  manual approval -> production deploy -> health check -> automatic
  rollback step on failure (chapter16/19/21/23)

## What is intentionally a placeholder
The actual `docker pull && run` / `kubectl` / `ssh` commands in `cd.yml`
are placeholders — this repo has no real staging/production host to
deploy to. Swap the placeholder `run:` lines for your actual deploy
mechanism; everything around them (the gating, the health checks, the
rollback trigger) is real and works as-is.

## Try it locally
```bash
cp .env.example .env
docker compose up --build
curl localhost:8000/health
curl localhost:8000/ready
pytest
```

## Try the pipeline
Push this folder as (or into) a GitHub repo. Configure a `staging` and a
`production` Environment (Settings -> Environments), with at least one
required reviewer on `production`. Push to `main` and watch CI run, then
CD deploy to staging automatically and pause for your approval before
"production."

## What to do next
Replace every placeholder `echo "..."` deploy/health-check line with a
real command for wherever you actually want to run this — a VM via SSH,
a container platform, or Kubernetes. The pipeline *shape* — gates, health
checks, rollback path — does not need to change; only those lines do.
