# Diagnose a failed deployment

## Investigation
Correlate the deployment marker timestamp against error rate/latency
graphs (chapter23). Check `/ready` output for the specific failing
dependency (chapter20).

## Commands
```bash
curl -s http://<host>/ready | python3 -m json.tool
```

## Production considerations
See chapter25 for ten specific worked incidents.
