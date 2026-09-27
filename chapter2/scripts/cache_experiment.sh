#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../examples"
echo "== Build 1 (cold) =="
docker build -t layers-demo:v1 .
echo
echo "== Build 2 (should be fully cached, note 'CACHED' on every step) =="
docker build -t layers-demo:v1 .
echo
echo "== Touch source, build 3 (only the COPY layer + after should rebuild) =="
echo "# touched $(date)" >> src/app.py
docker build -t layers-demo:v1 .
git checkout -- src/app.py 2>/dev/null || true
