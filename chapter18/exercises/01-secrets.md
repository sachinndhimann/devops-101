# Exercise 18.1
Add a repo secret. Run `with-secrets.yml` manually (workflow_dispatch).
Confirm the log shows `***` where the secret value would be, even though
your step explicitly echoed it.

# Exercise 18.2 — git history never forgets
In a throwaway test repo, commit a fake "password" in a file, then commit
a second time removing it. Run `git log -p -- <file>` and confirm the
fake password is still visible in history. What's the actual fix (hint:
it's not `git rm`)?

# Exercise 18.3
Write out, as pseudocode/comments only (no real credentials), what an
`.env.production` file would need to contain for `sample-app`, and mark
which of those lines are secrets vs plain config per this chapter's
definition.
