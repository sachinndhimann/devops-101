"""
Minimal FastAPI app used throughout devops-101 as the thing we containerize,
compose, ship through CI/CD, and deploy.

Deliberately simple: a counter backed by Redis, and a note backed by Postgres.
The goal is to have real network dependencies (DB + cache) to make
networking/compose/health-check chapters concrete, without app complexity
getting in the way of the DevOps lessons.
"""
import time

from fastapi import FastAPI, HTTPException
import redis
from sqlalchemy import create_engine, text

from app.config import settings

app = FastAPI(title="devops-101 sample-app", version=settings.app_version)

_redis_client = None
_db_engine = None


def get_redis():
    global _redis_client
    if _redis_client is None:
        _redis_client = redis.from_url(settings.redis_url, socket_connect_timeout=2)
    return _redis_client


def get_engine():
    global _db_engine
    if _db_engine is None:
        _db_engine = create_engine(settings.database_url, pool_pre_ping=True)
    return _db_engine


@app.get("/")
def root():
    return {"service": "sample-app", "version": settings.app_version, "env": settings.environment}


@app.get("/health")
def health():
    """
    Liveness probe: is the process itself alive?
    Must NOT check dependencies. A dead DB should not kill a healthy process.
    """
    return {"status": "alive"}


@app.get("/ready")
def ready():
    """
    Readiness probe: can this instance actually serve traffic right now?
    Checks dependencies. Used by load balancers/orchestrators to decide
    whether to route traffic to this instance.
    """
    checks = {}
    ok = True

    try:
        get_redis().ping()
        checks["redis"] = "ok"
    except Exception as e:
        checks["redis"] = f"error: {e}"
        ok = False

    try:
        with get_engine().connect() as conn:
            conn.execute(text("SELECT 1"))
        checks["database"] = "ok"
    except Exception as e:
        checks["database"] = f"error: {e}"
        ok = False

    if not ok:
        raise HTTPException(status_code=503, detail=checks)
    return {"status": "ready", "checks": checks}


@app.post("/counter/increment")
def increment_counter():
    r = get_redis()
    value = r.incr("hit_counter")
    return {"counter": value}


@app.get("/counter")
def get_counter():
    r = get_redis()
    value = r.get("hit_counter")
    return {"counter": int(value) if value else 0}


@app.get("/slow")
def slow(seconds: float = 2.0):
    """Used to demo graceful shutdown / SIGTERM handling under load."""
    time.sleep(seconds)
    return {"slept": seconds}
