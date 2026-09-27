# Perform a blue-green deployment

## Implementation
Deploy the new version fully to an idle (green) environment behind the
same data layer. Smoke-test it directly. Flip the load balancer/DNS to
green all at once (chapter19).

## Validation
Confirm 100% of new traffic hits green, and blue is left running
(untouched) for instant rollback.

## Production considerations
Keep blue running for a defined bake period before decommissioning it —
that is your rollback safety net (chapter21).
