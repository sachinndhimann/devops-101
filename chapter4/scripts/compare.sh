#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../examples"
docker build -f Dockerfile.bad -t df-bad . -q
docker build -f Dockerfile.better -t df-better . -q
docker build -f Dockerfile.production -t df-prod . -q
docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}" | grep -E "df-bad|df-better|df-prod|REPOSITORY"
