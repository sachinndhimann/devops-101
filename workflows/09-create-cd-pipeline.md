# Wire up staging -> production CD

## Implementation
Copy chapter16's `cd.yml`: auto-deploy to a `staging` Environment,
health-check, require approval on a `production` Environment, deploy,
health-check again.

## Validation
Confirm the workflow actually pauses for approval before touching
production.

## Production considerations
Configure real reviewers on the `production` Environment in repo
settings — an unconfigured Environment approves nothing and gates
nothing.
