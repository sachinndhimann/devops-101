# Debug missing/unexpected persisted data

## Investigation
Was a volume actually mounted, or did the container use its ephemeral
writable layer?

## Commands
```bash
docker inspect <container> --format "{{json .Mounts}}" | python3 -m json.tool
docker volume ls
docker volume inspect <volume>
```

## Production considerations
See chapter6. `docker compose down -v` deletes volumes — confirm this
was not run against a shared environment by mistake.
