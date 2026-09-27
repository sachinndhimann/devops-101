# Exercise 24.1
Draw (Mermaid or by hand) the full architecture diagram from memory,
labeling which chapter taught you each box and arrow. Compare against this
chapter's diagram.

# Exercise 24.2
Identify every single point of shared state in the architecture diagram
(hint: there are exactly two). Explain why the API instances are NOT
points of shared state, referencing chapter3 (disposability) and chapter6
(volumes).

# Exercise 24.3
If you had to scale this architecture to handle 10x traffic, which boxes
would you scale horizontally (add more instances) vs vertically (bigger
instance) vs neither (needs a different architecture entirely, e.g.
read replicas for Postgres)? Justify each.
