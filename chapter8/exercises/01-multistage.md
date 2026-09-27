# Exercise 8.1
Run `scripts/compare_sizes.sh`. Record both image sizes. What percentage
smaller is the multi-stage image?

# Exercise 8.2 — three stages
Add a third stage, `test`, based on the builder stage, that `COPY`s a test
file and runs `pytest`. Confirm `docker build --target test .` runs the
tests, while a normal `docker build .` still produces the slim runtime
image and never executes the test stage.

# Exercise 8.3
Explain, specifically, why `pip install --user` plus copying
`/root/.local` is the mechanism that lets installed *packages* cross the
stage boundary while the *compiler used to build some of them* does not.
