# Exercise 21.1
Write a rollback runbook entry for `sample-app`: exact commands to revert
the application to a previous SHA, and a checklist question ("has the DB
schema changed since that SHA was live? if yes, is it forward-compatible
with the old code?").

# Exercise 21.2 — irreversible migration
Identify one migration type that's genuinely NOT reversible without a
backup (hint: think about `DROP COLUMN` vs `RENAME COLUMN` vs
`ADD COLUMN`). Which of the three is safest to include as step 1 of a
rollback-friendly release?

# Exercise 21.3
Trigger `examples/.github/workflows/rollback.yml` manually
(`workflow_dispatch`) with a fake tag and confirm the approval gate from
chapter16's `production` Environment still applies — a rollback to
production is still a production deployment and should go through the
same gate.
