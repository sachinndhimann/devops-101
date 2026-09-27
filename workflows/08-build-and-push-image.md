# Wire CI to build and push an image

## Implementation
Copy chapter14's `docker-publish.yml`: tag with SHA + latest, login via
GITHUB_TOKEN (GHCR) or a registry-specific secret, push both tags.

## Validation
Confirm the image lands in your registry's package listing with the
correct tags.

## Production considerations
Always deploy by SHA, never by `latest` alone (chapter14/21).
