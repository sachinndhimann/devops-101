# Exercise 15.1
Push an image to GHCR (or Docker Hub) from your own machine using a
Personal Access Token, not your account password. Then log out and try
to pull a *private* version of it — confirm it fails, then log back in and
confirm it succeeds.

# Exercise 15.2 — manifest inspection
Run `docker manifest inspect` against a public image (e.g. `python:3.12-slim`)
and identify the different platform architectures listed (amd64, arm64,
etc.) inside one "multi-arch" tag.

# Exercise 15.3
Design (in writing, no need to implement) a retention policy for a
registry that receives one new SHA-tagged image per commit on a
repo that merges ~20 PRs/day. What would you keep, for how long, and why?
