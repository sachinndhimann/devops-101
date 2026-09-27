# Exercise 17.1
Create `.env.staging` and `.env.production` (gitignored) with different
`LOG_LEVEL` and `ENVIRONMENT` values. Run the app under each and confirm
`GET /` reflects the right `env` value without rebuilding the image.

# Exercise 17.2 — find a hardcoded value
Grep `sample-app/app` for anything that looks environment-specific but is
hardcoded rather than read from `settings`. (If you don't find one, add
one deliberately, then fix it — that's the point of the exercise.)

# Exercise 17.3
Write, in one paragraph, why "build once, promote the same artifact" is
safer than "rebuild per environment," specifically in terms of what you're
actually testing in staging before it hits production.
