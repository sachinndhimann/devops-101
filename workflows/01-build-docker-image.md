# Build a Docker image

## Investigation
Confirm you have a Dockerfile and know your build context (chapter2/4).

## Commands
```bash
docker build -t myapp:$(git rev-parse --short HEAD) .
```

## Implementation
Tag with the commit SHA (chapter14), not just `latest`.

## Validation
`docker run --rm myapp:<sha> --version` (or an equivalent smoke command).

## Production considerations
Use multi-stage (chapter8), non-root (chapter10), and a `.dockerignore`
(chapter9) before this ever reaches CI.
