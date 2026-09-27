# Exercise 13.1
Push this workflow. Confirm the four jobs run in order (`needs:` chains
them) and that GitHub renders them as a dependency graph in the Actions
tab, not just a flat list.

# Exercise 13.2 — fail fast
Introduce a lint error. Push. Confirm `unit-tests`, `integration-tests`,
and `build` never start. Now fix the lint error but break a unit test
instead — confirm integration-tests/build still get skipped, but lint
still runs and passes.

# Exercise 13.3 — caching
Time the `unit-tests` job on a cold cache vs. a second run with the cache
populated. What's the time difference for `pip install`?
