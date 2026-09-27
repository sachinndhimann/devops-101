# Debug container-to-container networking

## Investigation
Same Docker network? Correct hostname (service name, not localhost)?

## Commands
```bash
docker network ls
docker network inspect <network>
docker exec <c> nslookup <other-service-name>
docker exec <c> env | grep URL
```

## Production considerations
See chapter5 and chapter25 Incident 6.
