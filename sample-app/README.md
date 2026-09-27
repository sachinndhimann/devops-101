# sample-app

The app used throughout devops-101. FastAPI + Postgres + Redis.

## Run locally (no Docker)
```bash
pip install -r requirements.txt
uvicorn app.main:app --reload
```

## Run in Docker
```bash
docker build -t sample-app .
docker run -p 8000:8000 sample-app
```
Note: `/ready` will fail without a reachable Postgres/Redis — that's
intentional, see chapter5 (networking) and chapter7 (compose).

## Endpoints
- `GET /health` — liveness (process alive)
- `GET /ready` — readiness (dependencies reachable)
- `GET /counter`, `POST /counter/increment` — Redis-backed counter
- `GET /slow?seconds=N` — for graceful-shutdown experiments

## Tests
```bash
pytest
```
