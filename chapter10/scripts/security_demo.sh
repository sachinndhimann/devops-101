#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/../examples"
docker build -f Dockerfile.insecure -t insecure-demo . -q
docker build -f Dockerfile.secure -t secure-demo . -q
echo "insecure:"; docker run --rm insecure-demo
echo "secure:"; docker run --rm secure-demo
echo
echo "-- attempting write to /etc as each --"
docker run --rm insecure-demo sh -c "touch /etc/pwn && echo 'insecure: wrote to /etc'"
docker run --rm --read-only --tmpfs /tmp secure-demo sh -c "touch /etc/pwn && echo 'wrote' || echo 'secure: write to /etc blocked (read-only fs)'"
