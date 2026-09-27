# Exercise 4.1
Run `scripts/compare.sh`. Rank the three images by size. Which single
change contributed most to the size difference between bad and better?

# Exercise 4.2 — CMD vs ENTRYPOINT
Build an image with `ENTRYPOINT ["echo"]` and `CMD ["default", "args"]`.
Run it with no arguments, then with `docker run <image> override`. Explain
the output difference.

# Exercise 4.3 — find the secret
`docker history --no-trunc df-bad` and locate the leaked API key. Then
explain why deleting the `ENV` line in a *later* layer would NOT remove it
from the image.
