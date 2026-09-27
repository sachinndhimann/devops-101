# Production-readiness checklist for a new service

## Checklist
- [ ] Multi-stage, non-root Dockerfile (chapter8/10)
- [ ] .dockerignore + optimized layer order (chapter9)
- [ ] /health (liveness) and /ready (readiness) endpoints (chapter1/23)
- [ ] Graceful SIGTERM handling (chapter11)
- [ ] Resource limits set from measured usage (chapter11)
- [ ] Config fully externalized, no hardcoded environment values (chapter17)
- [ ] Secrets in a secret store, never in source (chapter18)
- [ ] CI: lint, test, build, scan, gated in that order (chapter13/22)
- [ ] CD: staging auto-deploy, production requires approval (chapter16)
- [ ] Deployment strategy chosen deliberately, not defaulted (chapter19)
- [ ] Rollback runbook written and rehearsed (chapter21)
- [ ] Deployment markers wired into your metrics dashboard (chapter23)
