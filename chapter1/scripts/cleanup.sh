#!/usr/bin/env bash
# Stops and removes every container started during this chapter's experiments.
docker ps -aq --filter "ancestor=alpine" | xargs -r docker rm -f
