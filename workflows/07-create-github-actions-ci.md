# Set up CI for a new repo

## Implementation
Copy chapter13's `ci.yml` pattern: lint -> unit tests -> integration
tests (with service containers) -> build. Adjust paths for your project
layout.

## Validation
Push a branch, confirm the Actions tab shows the job graph you expect.

## Production considerations
Add `permissions:` explicitly (chapter22) rather than relying on
defaults.
