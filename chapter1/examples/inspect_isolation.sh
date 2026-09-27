#!/usr/bin/env bash
set -euo pipefail
echo "== Inside container: process list =="
docker run --rm alpine sh -c "ps aux; echo; hostname; echo; cat /etc/os-release | head -2"
echo
echo "== Outside: this alpine process does not persist (it already exited) =="
echo "Run 'docker run -d alpine sleep 300' then 'ps aux | grep sleep' on your host to see the real PID."
