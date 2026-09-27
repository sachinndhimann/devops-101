#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../examples"
docker build -f Dockerfile.bad -t bad-signals . -q
docker build -f Dockerfile.good -t good-signals . -q
docker rm -f bad good >/dev/null 2>&1 || true
docker run -d --name bad bad-signals >/dev/null
docker run -d --name good good-signals >/dev/null
sleep 1
echo "-- stopping bad (ignores SIGTERM) --"
time docker stop bad
echo "-- stopping good (handles SIGTERM) --"
time docker stop good
docker rm bad good >/dev/null
