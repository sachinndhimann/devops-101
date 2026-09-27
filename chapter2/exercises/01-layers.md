# Exercise 2.1
Build `examples/Dockerfile`, then `docker history` it. Which instruction
produced the largest layer? Why is `apk add curl` its own layer instead of
being merged with the base?

# Exercise 2.2 — Reorder for caching
Take `examples/Dockerfile.bad-order`, fix the instruction order so that
changing `src/app.py` no longer invalidates the `apk add` layer. Prove it
with two builds and `docker history`.

# Exercise 2.3 — Tags vs digests
Run `docker inspect alpine:3.20 --format '{{.RepoDigests}}'`. Explain, in
your own words, why this digest — not the tag `3.20` — is what you'd pin
in a production deployment.
