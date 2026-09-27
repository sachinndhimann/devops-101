# Roadmap

Work through in order. Each chapter has a README.md (concept + diagram +
example + failure/debug + exercise), `examples/` (runnable code),
`scripts/` (helper shell scripts), and `exercises/` (tasks, no answers).

| # | Chapter | Core question it answers |
|---|---------|---------------------------|
| 1 | Container Fundamentals | What actually *is* a container? |
| 2 | Docker Images | How does a Dockerfile become a runnable artifact? |
| 3 | Docker Containers | How do you run, inspect, and manage containers? |
| 4 | Dockerfiles | What does each instruction actually do? |
| 5 | Docker Networking | How do containers talk to each other and the host? |
| 6 | Volumes & Storage | How does data survive a container's death? |
| 7 | Docker Compose | How do you run a multi-service stack? |
| 8 | Multi-stage Builds | How do you keep build tools out of production images? |
| 9 | Image Optimization | How do you make images small and builds fast? |
| 10 | Container Security | What makes a container dangerous, and how do you fix it? |
| 11 | Resource Management | How do you bound CPU/memory and shut down cleanly? |
| 12 | GitHub Actions Fundamentals | What is a workflow, job, step, runner? |
| 13 | CI Pipelines | How do you automatically answer "is this safe to merge?" |
| 14 | Docker + GitHub Actions | How do you build and push images from CI? |
| 15 | Container Registries | Where do images live between build and deploy? |
| 16 | CD / Continuous Delivery | How do you go from image to running service? |
| 17 | Environment Management | How does one app run differently per environment? |
| 18 | Secrets Management | How do you keep credentials out of source and logs? |
| 19 | Deployment Strategies | Recreate vs rolling vs blue-green vs canary? |
| 20 | Zero-Downtime Deployments | What has to be true for a deploy to be invisible to users? |
| 21 | Rollbacks | How do you undo a bad deploy safely? |
| 22 | CI/CD Security | How is your pipeline itself an attack surface? |
| 23 | Observability & Deployment | How do you know a deploy actually worked? |
| 24 | Production Architecture | How does it all fit together at scale? |
| 25 | Production Debugging | 10 real incidents, worked end to end |

Then: `final-project/` — a complete FastAPI + Postgres + Redis app with
CI, CD, staging simulation, and a documented rollback path.
