# Exercise 22.1
Rewrite chapter13's `ci.yml` with an explicit minimal `permissions:` block
per job (most jobs there need nothing beyond `contents: read`). Which job,
if any, needs anything broader?

# Exercise 22.2 — pinned vs floating actions
Explain the difference in trust model between `uses: actions/checkout@v4`
and `uses: actions/checkout@<full-commit-sha>`. Why does the second one
protect you even if the `v4` tag itself is later moved to point at
different code?

# Exercise 22.3
Design a workflow split for a repo that accepts PRs from forks: which
steps should run with zero secrets available (safe for untrusted code),
and which steps (needing secrets/deploy access) should only run after a
maintainer explicitly approves, on trusted code only?
