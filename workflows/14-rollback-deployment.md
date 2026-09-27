# Execute a rollback

## Implementation
Application: redeploy the previous known-good SHA (chapter14/21).
Database: assess separately — do NOT assume application rollback fixes
schema state (chapter20/21).

## Validation
Re-run health checks (chapter23) after rollback, do not assume success.

## Production considerations
Rehearse this in staging before you need it for real — see chapter25
Incident 10.
