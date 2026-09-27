# Exercise 11.1
Run `scripts/signal_demo.sh`. Note the time difference between stopping
`bad` vs `good`. Explain exactly what happens during those ~10 seconds for
the bad container.

# Exercise 11.2 — OOM
Run a container with `--memory=50m` that tries to allocate 200MB in
Python. Confirm it gets OOM-killed via `docker inspect ... OOMKilled`.
Then raise the limit to 300MB and confirm it succeeds.

# Exercise 11.3 — CPU limits
Run `docker run --cpus=0.25 --rm python:3.12-slim python -c "while True: pass"`
in one terminal and watch `docker stats` in another. What percentage CPU
does it show, and how does that relate to `--cpus=0.25`?
