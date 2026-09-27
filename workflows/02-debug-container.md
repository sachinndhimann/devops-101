# Debug a running/crashed container

## Investigation
Is it running, restarting, or exited?

## Commands
```bash
docker ps -a
docker logs --tail 100 <id>
docker inspect <id> --format "{{.State.ExitCode}} {{.State.OOMKilled}}"
docker exec -it <id> sh   # only if still running
```

## Production considerations
See chapter25 Incident 1 for the full crash-loop walkthrough.
