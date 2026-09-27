#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../examples"
echo "== Unoptimized build =="
time docker build -f Dockerfile.unoptimized -t unopt . --no-cache -q
echo "== Optimized build =="
time docker build -f Dockerfile.optimized -t opt . --no-cache -q
echo
docker images --format "table {{.Repository}}\t{{.Size}}" | grep -E "unopt|^opt|REPOSITORY"
