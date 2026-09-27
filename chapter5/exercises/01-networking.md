# Exercise 5.1
Create a network, run two alpine containers on it, and from one `ping`
the other by container name. Then repeat without a shared network and
explain the failure.

# Exercise 5.2 — port mapping
Run an nginx container with `-p 8081:80`. Curl `localhost:8081`. Then run
`docker inspect` and find exactly where the port mapping is recorded.
What happens if you run a second nginx with the same `-p 8081:80`?

# Exercise 5.3 — host network
Run a container with `--network host` and one with default networking,
both trying to bind port 8000. What's different about how you'd reach
each one, and why can only one container ever use `--network host` for a
given host port at a time?
