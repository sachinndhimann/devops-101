# Exercise 1.1 — Prove the shared kernel

1. Run `uname -r` on your host.
2. Run `docker run --rm alpine uname -r`.
3. They should match. Explain in one paragraph *why* they match, using the
   words "namespace" and "kernel".
4. Run the same image on an Apple Silicon Mac and an x86 Linux box (or
   read about it if you only have one). What's different about how the
   kernel is provided in each case?

# Exercise 1.2 — Kill PID 1

1. `docker run -d --name test1 alpine sleep 300`
2. `docker exec test1 kill 1`
3. `docker ps -a` — what state is the container in? Why did `sleep 300`
   dying take the whole container down with it?
