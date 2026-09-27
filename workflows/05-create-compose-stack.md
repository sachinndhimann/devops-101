# Stand up a new multi-service stack

## Implementation
Start from the root `docker-compose.yml` pattern: one service per
process, a healthcheck per stateful dependency, `depends_on: condition:
service_healthy` gating app startup (chapter7).

## Validation
`docker compose up --build` then `docker compose ps` — every service
should show healthy, not just running.

## Production considerations
Compose is for local/single-host; see chapter24 for what changes moving
to a real multi-host production setup.
