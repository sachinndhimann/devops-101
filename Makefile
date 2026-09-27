.PHONY: up down logs ps build test clean shell-app shell-db

up:
	docker compose up --build

down:
	docker compose down

logs:
	docker compose logs -f

ps:
	docker compose ps

build:
	docker compose build

test:
	cd sample-app && pip install -r requirements.txt -q && pytest -q

clean:
	docker compose down -v --remove-orphans
	docker system prune -f

shell-app:
	docker compose exec app /bin/bash

shell-db:
	docker compose exec db psql -U postgres -d appdb
