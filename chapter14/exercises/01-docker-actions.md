# Exercise 14.1
Push this workflow to a real repo (adjust `sample-app` path if needed).
Confirm the image shows up in the repo's Packages tab tagged with both
the commit SHA and `latest`.

# Exercise 14.2 — break permissions
Remove the `permissions:` block entirely and push again. Read the exact
error message from the push step. What does it tell you about GitHub's
default token permissions?

# Exercise 14.3 — pin a rollback target
Note down the SHA-tagged image from a successful run. Make an unrelated
commit and push again (new SHA, new image). Manually run
`docker pull ghcr.io/<owner>/<repo>:<old-sha>` — confirm the old image is
still there, untouched, even though `latest` has moved on.
