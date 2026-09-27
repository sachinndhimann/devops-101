# Exercise 23.1
Add a request-timing middleware to `sample-app`'s FastAPI app that logs
each request as structured JSON (path, status code, duration_ms). Hit a
few endpoints and confirm you can `grep`/`jq` the logs by path.

# Exercise 23.2 — liveness vs readiness in practice
Simulate a slow-but-alive dependency: make `/ready`'s Redis check sleep 5
seconds before pinging. Would this correctly cause a load balancer to stop
routing traffic here, assuming a reasonable readiness-probe timeout? What
would happen if you'd wired this slowness into `/health` instead?

# Exercise 23.3
Design (in writing) a deployment-marker mechanism for this repo: what
event would you emit, from where in the CD pipeline (chapter16), and what
would you annotate on a hypothetical dashboard with it?
