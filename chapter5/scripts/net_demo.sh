#!/usr/bin/env bash
set -euo pipefail
docker network create appnet 2>/dev/null || true
docker rm -f netdemo-db >/dev/null 2>&1 || true
docker run -d --name netdemo-db --network appnet \
  -e POSTGRES_PASSWORD=pw postgres:16-alpine >/dev/null
sleep 3
echo "== Same network: resolves 'netdemo-db' by name =="
docker run --rm --network appnet postgres:16-alpine \
  psql -h netdemo-db -U postgres -c "select 'connected' as status" || true
echo
echo "== Default bridge: name resolution fails =="
docker run --rm postgres:16-alpine \
  psql -h netdemo-db -U postgres -c "select 1" || echo "(expected failure above)"
docker rm -f netdemo-db >/dev/null
