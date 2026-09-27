"""
Minimal illustration of structured logging + basic metrics, without
pulling in a full observability stack. Real production code would use
the `logging` module with a JSON formatter and a real metrics library
(prometheus_client, statsd, etc.) — this is the concept in ~30 lines.
"""
import json
import time
from collections import defaultdict

request_count = defaultdict(int)
latencies = []


def log_json(**fields):
    print(json.dumps({"ts": time.time(), **fields}))


def handle_request(path, duration_ms):
    request_count[path] += 1
    latencies.append(duration_ms)
    log_json(event="request", path=path, duration_ms=duration_ms)


if __name__ == "__main__":
    handle_request("/health", 1.2)
    handle_request("/ready", 4.8)
    handle_request("/counter", 12.3)
    p99 = sorted(latencies)[-1]
    log_json(event="summary", total_requests=sum(request_count.values()), p99_ms=p99)
