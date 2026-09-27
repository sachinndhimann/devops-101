# Cheatsheet

## Images
```
docker build -t NAME:TAG .
docker images
docker pull NAME:TAG
docker push NAME:TAG
docker tag SRC DST
docker history NAME:TAG
docker inspect NAME:TAG
```

## Containers
```
docker run -d -p HOST:CONTAINER --name NAME IMAGE
docker ps -a
docker stop NAME
docker start NAME
docker restart NAME
docker exec -it NAME /bin/bash
docker logs -f NAME
docker rm NAME
docker rm -f NAME        # force remove running container
```

## Networking
```
docker network ls
docker network create NAME
docker network inspect NAME
docker run --network NAME ...
```

## Volumes
```
docker volume ls
docker volume create NAME
docker volume inspect NAME
docker run -v NAME:/path/in/container ...
docker run -v $(pwd):/path/in/container ...   # bind mount
```

## Compose
```
docker compose up --build
docker compose up -d
docker compose down
docker compose down -v          # also remove volumes
docker compose logs -f SERVICE
docker compose ps
docker compose exec SERVICE sh
```

## Cleanup
```
docker system df
docker system prune -f
docker image prune -a -f
docker volume prune -f
```

## GitHub Actions
```
on: [push, pull_request]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: { python-version: "3.12" }
```

## Signals
```
SIGTERM  -> "please shut down gracefully" (default docker stop)
SIGKILL  -> "shut down NOW" (docker kill, or after --time grace period)
PID 1    -> your process must forward SIGTERM to children, or use tini/dumb-init
```
