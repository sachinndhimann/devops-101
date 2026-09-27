# Perform a canary deployment

## Implementation
Route a small percentage of real traffic to the new version. Watch error
rate/latency (chapter23) before ramping further (chapter19).

## Validation
Confirm you have a fast "pull the canary" mechanism that does not
require a full redeploy to execute.

## Production considerations
Needs real metrics/dashboards to be worth the added complexity over a
plain rolling deploy — do not adopt canary without observability
(chapter23) already in place.
