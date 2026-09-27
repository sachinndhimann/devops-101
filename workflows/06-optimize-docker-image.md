# Shrink a bloated image

## Investigation
`docker history --no-trunc <image>` to find the largest layers.

## Implementation
Apply, in order: `.dockerignore` (chapter9), reorder deps-before-code
(chapter2), multi-stage build (chapter8), slimmer base image (chapter9).

## Validation
Compare `docker images` size before/after.

## Production considerations
Smaller images mean faster deploys and rollbacks (chapter21).
