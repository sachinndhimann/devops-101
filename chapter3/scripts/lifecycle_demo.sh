#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../examples"
docker build -t chapter3-demo .
docker run -d --name demo -p 8080:8000 chapter3-demo
sleep 1
echo "-- running --"; docker ps --filter name=demo
docker stop demo
echo "-- stopped, still exists --"; docker ps -a --filter name=demo
docker start demo
echo "-- restarted --"; docker ps --filter name=demo
docker rm -f demo
