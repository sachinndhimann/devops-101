#!/usr/bin/env bash
set -euo pipefail
ENV="$1"; IMAGE="$2"
echo "PRETEND deploying $IMAGE to $ENV"
echo "(Replace this with: kubectl set image / aws ecs update-service / ssh + compose pull / terraform apply)"
