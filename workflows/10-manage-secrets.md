# Add and use a new secret safely

## Implementation
Add via repo/environment/org Secrets in GitHub settings (chapter18) —
never hardcode. Reference via secrets context as an env var in the
step that needs it, nowhere else.

## Validation
Confirm GitHub redacts the value in logs even when a step echoes it.

## Production considerations
Rotate on any suspected exposure immediately — do not just delete the
reference.
