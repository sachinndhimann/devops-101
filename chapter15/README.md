# Chapter 15 — Container Registries

## Concept
A registry stores images by content-addressed layers (chapter2) and
serves them via push/pull. The registry is the handoff point between "CI
built this" and "CD deploys this."

## Mental model
Think of a registry as a content-addressed package repository — like
PyPI, but for images. Pulling is cheap when layers already exist locally
or in a nearby cache; only new layers transfer.

## Registries compared
| Registry | Notes |
|---|---|
| Docker Hub | Default, public by default on free tier, rate-limited pulls for anonymous/free accounts |
| GitHub Container Registry (GHCR) | Tied to your GitHub repo/org, easy auth via `GITHUB_TOKEN` in Actions (chapter14) |
| Private registry (self-hosted, AWS ECR, GCP Artifact Registry, etc.) | Full control, needed for compliance/air-gapped environments |

## Implementation
```bash
docker login ghcr.io -u <username>            # password: a Personal Access Token, not your GitHub password
docker tag sample-app ghcr.io/<owner>/sample-app:v1
docker push ghcr.io/<owner>/sample-app:v1
docker pull ghcr.io/<owner>/sample-app:v1     # from a different machine
```

## Run / Observe
```bash
docker logout ghcr.io
docker pull ghcr.io/<owner>/sample-app:v1     # public image: still works
                                               # private image: now fails — auth required
```

## Break it
Try to `docker push` without `docker login` first:
```bash
docker push ghcr.io/<owner>/sample-app:v1
# denied: requesting push access, please authenticate first
```

## Debug
`docker manifest inspect ghcr.io/<owner>/sample-app:v1` shows you exactly
what's in the registry for a tag without pulling the whole image — useful
for confirming a CI push actually landed the layers you expect.

## Production implications
- **Immutable tags**: some registries let you configure a tag as
  immutable once pushed — prevents a `latest`-style accidental overwrite
  of a tag something else already depends on.
- **Retention policies**: registries fill up with old SHA-tagged images
  fast. Set a retention policy (e.g. "keep last 50 tags, or last 90 days")
  rather than manually pruning.
- Authentication in CI should use short-lived or scoped tokens
  (`GITHUB_TOKEN`, workload identity federation) rather than long-lived
  static credentials — see chapter18/22.

## Exercise
See `exercises/01-registries.md`.
