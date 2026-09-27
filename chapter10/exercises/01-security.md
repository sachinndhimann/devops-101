# Exercise 10.1
Run `scripts/security_demo.sh`. Confirm the insecure container can write
to `/etc` and the secure one (run `--read-only`) cannot.

# Exercise 10.2 — capabilities
Run `docker run --rm --cap-drop=ALL alpine ping -c1 8.8.8.8` — it fails,
because ICMP sockets need `CAP_NET_RAW`. Add back only that capability
with `--cap-add=NET_RAW` and confirm it now works. What does this tell you
about "just run everything as root, it's easier"?

# Exercise 10.3 — scan an image
If you have Trivy or Docker Scout available, scan `python:3.12` vs
`python:3.12-slim` vs `python:3.12-alpine`. Which has the fewest known
CVEs? Does that match your size-based intuition from chapter9?
