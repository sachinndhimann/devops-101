-- STEP 1 (EXPAND): add the new column, keep the old one.
-- Deploy code in this same release that WRITES to both old and new columns.
ALTER TABLE users ADD COLUMN full_name TEXT;
UPDATE users SET full_name = first_name || ' ' || last_name;

-- STEP 2 (MIGRATE): after step 1 has baked (all instances on new code,
-- writing both columns), deploy code that READS from full_name only.
-- No schema change needed for this step — it's a code-only deploy.

-- STEP 3 (CONTRACT): after step 2 has fully rolled out and baked,
-- drop the columns nothing reads anymore.
ALTER TABLE users DROP COLUMN first_name;
ALTER TABLE users DROP COLUMN last_name;
