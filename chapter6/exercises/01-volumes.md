# Exercise 6.1
Run `scripts/volume_demo.sh` and confirm the row survives container
deletion. Then modify it to use `-v $(pwd)/pgdata_bind:/var/lib/postgresql/data`
(a bind mount) instead and confirm the data now lives in a folder you can
`ls` directly on your host.

# Exercise 6.2 — tmpfs
Run `docker run --tmpfs /secrets alpine sh -c "echo hi > /secrets/x.txt; cat /secrets/x.txt"`.
Where does that data live? What happens to it when the container stops?
Why would you use this for something like a decrypted secret at runtime?

# Exercise 6.3
`docker compose down` vs `docker compose down -v` — write one sentence on
when each is the correct command, and why running `-v` by habit in a
shared staging environment is dangerous.
