#!/usr/bin/env bash
set -euo pipefail
if [ $# -ne 1 ]; then
  echo "Usage: $0 <previous-good-image:tag>"
  exit 1
fi
PREVIOUS_IMAGE="$1"
echo "Rolling back to: $PREVIOUS_IMAGE"
echo "(placeholder — replace with: kubectl set image / ecs update-service / compose pull+up)"
echo "docker pull $PREVIOUS_IMAGE"
echo "docker stop current-app && docker run -d --name current-app $PREVIOUS_IMAGE"
