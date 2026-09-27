# Chapter 4 — Dockerfiles

## Concept
A Dockerfile is a recipe: each instruction produces one layer (chapter2).
Getting the instructions right is the difference between a 1.5GB image
that leaks secrets and a 60MB image that's safe to ship.

## Instruction reference
| Instruction | Purpose | Notes |
|---|---|---|
| `FROM` | base image | first instruction (or after `ARG` used in `FROM`) |
| `RUN` | execute a command, bake result into a layer | build-time only |
| `COPY` | copy files from build context into image | prefer over `ADD` |
| `ADD` | like COPY, plus URL fetch + auto-extract archives | avoid unless you need those extras — surprising behavior |
| `WORKDIR` | set/create the working directory | avoid `RUN cd` — it doesn't persist |
| `ENV` | set environment variable, baked into the image | visible to `docker inspect`, not secret-safe |
| `ARG` | build-time variable | NOT present in the final image or container env |
| `EXPOSE` | documentation only | does not publish the port — `-p` does that |
| `CMD` | default command, overridable at `docker run` | one per Dockerfile (last wins) |
| `ENTRYPOINT` | fixed command, args from `docker run` are appended | combine with `CMD` for default args |
| `USER` | switch to a non-root user for subsequent instructions | see chapter10 |
| `HEALTHCHECK` | command Docker runs periodically to judge container health | drives `docker ps` STATUS and orchestrator restarts |

## CMD vs ENTRYPOINT
```mermaid
flowchart TD
    A["ENTRYPOINT [\"python\", \"app.py\"]\nCMD [\"--verbose\"]"] --> B["docker run image\n→ python app.py --verbose"]
    A --> C["docker run image --quiet\n→ python app.py --quiet"]
```
- `CMD` alone: fully replaced by anything after `docker run image`.
- `ENTRYPOINT` alone: fixed; anything after `docker run image` is appended
  as arguments.
- Both together: `ENTRYPOINT` is the fixed program, `CMD` is the
  *overridable default* arguments.

## ENV vs ARG
- `ARG` only exists during `docker build`. Gone at runtime.
- `ENV` exists during build *and* persists into every container started
  from the image, visible via `docker inspect` / `env`.
- Never put secrets in either — `ARG`s land in build cache/history,
  `ENV`s land in the final image metadata. See chapter18.

## COPY vs ADD
Use `COPY` by default. Only reach for `ADD` when you specifically need its
extra behavior (remote URL fetch, or auto-extracting a local tarball) —
both are easy to trigger by accident and hard to notice in review.

## EXPOSE vs publishing
`EXPOSE 8000` is metadata for humans and tools (`docker inspect`,
`docker network` tooling) — it does **not** open the port. You still need
`docker run -p HOST:8000` or a compose `ports:` entry.

## Progression: bad → better → production
See `examples/Dockerfile.bad`, `examples/Dockerfile.better`,
`examples/Dockerfile.production` — build all three, compare sizes:
```bash
bash scripts/compare.sh
```

## Break it
`examples/Dockerfile.bad` runs as root and bakes a secret into an `ENV`.
```bash
docker build -f examples/Dockerfile.bad -t bad .
docker run --rm bad env | grep API_KEY   # secret is trivially readable
docker history bad --no-trunc | grep API_KEY  # and it's in the layer history too
```

## Debug
`docker history --no-trunc <image>` reveals the literal command that
created each layer — a fast way to catch accidentally-baked secrets or
unnecessary bloat.

## Production implications
`examples/Dockerfile.production` is what chapter8-10 build on: multi-stage,
non-root, pinned base image, `HEALTHCHECK`, no secrets.

## Exercise
See `exercises/01-instructions.md`.
