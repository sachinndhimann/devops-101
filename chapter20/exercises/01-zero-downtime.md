# Exercise 20.1
Using `sample-app`, add a readiness-breaking scenario: temporarily point
`REDIS_URL` at a nonexistent host and confirm `/ready` returns 503 while
`/health` still returns 200. Explain why a load balancer should trust
`/ready`, not `/health`, when deciding where to route traffic.

# Exercise 20.2 — design a migration
Design (write the three SQL/deploy steps, don't need to run them) an
expand-and-contract plan for splitting a `name` column into `first_name`
and `last_name` on a live table, safe for a rolling deployment.

# Exercise 20.3
Explain, in your own words, why "deploy code + migrate schema in one
release" is specifically dangerous during a *rolling* or *canary* rollout,
but less dangerous (though still not risk-free) during a *blue-green*
deployment where the cutover is instantaneous.
