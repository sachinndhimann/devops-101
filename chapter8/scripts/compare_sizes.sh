#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../examples"
docker build -f Dockerfile.single-stage -t single-stage-demo . -q
docker build -f Dockerfile.multi-stage -t multi-stage-demo . -q
echo
docker images --format "table {{.Repository}}\t{{.Size}}" | grep -E "single-stage-demo|multi-stage-demo|REPOSITORY"
echo
echo "gcc in single-stage image?"
docker run --rm single-stage-demo which gcc || echo "not found"
echo "gcc in multi-stage image?"
docker run --rm multi-stage-demo which gcc || echo "not found"
