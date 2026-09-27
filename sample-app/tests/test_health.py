from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_root():
    resp = client.get("/")
    assert resp.status_code == 200
    assert resp.json()["service"] == "sample-app"


def test_liveness():
    """Liveness should always pass regardless of dependency state."""
    resp = client.get("/health")
    assert resp.status_code == 200
    assert resp.json() == {"status": "alive"}
