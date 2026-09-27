# Exercise 19.1
Run `examples/simulate_strategies.py`. At tick 2, which strategy has
exposed the fewest users to the broken version, assuming no one has
intervened yet? Which has exposed the most?

# Exercise 19.2
For each of these services, pick the deployment strategy you'd use and
justify it in one sentence: (a) an internal admin tool used by 3 people,
(b) a payments API, (c) a public marketing website, (d) a recommendation
engine where a bug degrades quality but doesn't break anything visibly.

# Exercise 19.3 — rolling's hidden requirement
During a rolling deployment, v1 and v2 both serve traffic simultaneously
and typically share one database. Write out a concrete example of an API
response-shape change that would break v1 instances if v2 already changed
the DB schema — this is the problem chapter20's expand-and-contract
pattern solves.
