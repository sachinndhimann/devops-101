# Exercise 7.1
Bring up `examples/docker-compose.yml`. Confirm `app` waits for all three
dependencies to be healthy before starting (`docker compose logs app`
should show no connection-refused errors at all).

# Exercise 7.2 — break depends_on
Remove the `condition: service_healthy` from `db` (leave a bare
`depends_on: [db]`... note Compose requires the long form if any service
uses conditions — adjust as needed). Restart the stack 5 times in a loop
and see if you can catch a connection failure in `app`'s logs.

# Exercise 7.3
Add a `profiles: ["debug"]` service (e.g. `adminer` for a Postgres UI) that
only starts when you run `docker compose --profile debug up`. Confirm it
does NOT start on a plain `docker compose up`.
