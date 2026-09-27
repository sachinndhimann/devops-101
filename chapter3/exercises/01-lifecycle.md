# Exercise 3.1
Start a container, `docker exec` into it and create `/tmp/mydata.txt`.
Stop it, start it again, and confirm the file is still there. Now `rm -f`
it and start a *new* container from the same image — confirm the file is
gone. Explain why in terms of the writable layer.

# Exercise 3.2 — exit codes
Run three containers that exit with codes 0, 1, and 137 respectively
(hint: `sh -c "kill -9 $$"` for the last one). Use `docker inspect` to
read each exit code back. What does 137 specifically indicate?
