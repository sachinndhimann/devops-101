# Exercise 9.1
Run `scripts/optimize_demo.sh`. Compare both build times and image sizes.

# Exercise 9.2 — cache-only rebuild
Touch `app.py` (add a comment) and rebuild both images WITHOUT `--no-cache`.
Time each. Explain the difference using what you know about layer ordering
from chapter2.

# Exercise 9.3 — alpine gotcha
Try changing `Dockerfile.optimized`'s base image to `python:3.12-alpine`
and add `psycopg2-binary` to requirements.txt. Does it build cleanly? If
not, research why (hint: it needs a compiled C extension and Alpine's
libc differs from Debian's).
