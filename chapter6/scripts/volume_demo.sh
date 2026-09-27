#!/usr/bin/env bash
set -euo pipefail
docker volume rm -f ch6-pgdata >/dev/null 2>&1 || true
docker rm -f ch6-pg1 ch6-pg2 >/dev/null 2>&1 || true

docker volume create ch6-pgdata >/dev/null
docker run -d --name ch6-pg1 -v ch6-pgdata:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=pw postgres:16-alpine >/dev/null
sleep 4
docker exec ch6-pg1 psql -U postgres -c "create table t(x int); insert into t values (42);" >/dev/null
docker rm -f ch6-pg1 >/dev/null
echo "== container 1 deleted, starting container 2 with same volume =="
docker run -d --name ch6-pg2 -v ch6-pgdata:/var/lib/postgresql/data \
  -e POSTGRES_PASSWORD=pw postgres:16-alpine >/dev/null
sleep 4
docker exec ch6-pg2 psql -U postgres -c "select * from t;"
docker rm -f ch6-pg2 >/dev/null
docker volume rm ch6-pgdata >/dev/null
