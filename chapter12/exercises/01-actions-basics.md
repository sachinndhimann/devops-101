# Exercise 12.1
Fork or push this repo to GitHub. Confirm `examples/.github/workflows/hello.yml`
(copy it to the repo root's `.github/workflows/` to activate it) runs on
push and shows green.

# Exercise 12.2 — matrix build
Modify the workflow to run the test job against Python 3.11 AND 3.12 using
`strategy: matrix: python-version: ["3.11", "3.12"]`. Confirm two separate
job rows appear in the Actions tab.

# Exercise 12.3 — break it on purpose
Introduce a YAML indentation error. Push. Where does GitHub report the
error, and how is that different from a normal step failure?
