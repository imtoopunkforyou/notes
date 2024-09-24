# Top-level Makefile for `PROJECT NAME` project
#
# To use you need to enter `make <command>`
#
# To create custom commands you need to create file with `CUSTOM_MAKEFILES` name in your project directory
# You can override any commands of the current file in your custom files
# Custom files have been added to `./.gitignore` and will not go to the remote repository
# Storing custom files is entirely the responsibility of the developer

# === Сonfiguration ===
MAKEFLAGS += --silent
CUSTOM_MAKEFILES=*.mk MyMakefile
make:
	cat -n ./Makefile

# === Build ====
dc-build:
	docker-compose -f docker-compose-local.yml up -d --build
dc-restart:
	docker-compose -f docker-compose-local.yml restart
dc-up:
	docker-compose -f docker-compose-local.yml up -d
dc-down:
	docker-compose -f docker-compose-local.yml down
dc-down-v:
	docker-compose -f docker-compose-local.yml down --volumes

# === Entry containers ====
bash-db:
	docker exec -it postgres bash
bash-api:
	docker exec -it proj-api bash
bash-dash:
	docker exec -it proj-dash bash
bash-celery:
	docker exec -it proj-celery bash
bash-celery-pushes:
	docker exec -it proj-celery-pushes bash
bash-redis:
	docker exec -it redis bash

# === Logs ===
logs-db:
	docker logs postgres
logs-api:
	docker logs proj-api
logs-dash:
	docker logs proj-dash
logs-celery:
	docker logs proj-celery
logs-celery-pushes:
	docker logs proj-celery-pushes
logs-redis:
	docker logs redis

# === Follow logs ===
logs-f-db:
	docker logs -f postgres
logs-f-api:
	docker logs -f proj-api
logs-f-dash:
	docker logs -f proj-dash
logs-f-celery:
	docker logs -f proj-celery
logs-f-celery-pushes:
	docker logs -f proj-celery-pushes
logs-f-redis:
	docker logs -f redis

# === Database ===
psql:
	docker exec -it postgres psql -U proj proj

# === Alembic ===
alembic-upgrade:
	docker exec -it proj-api alembic -c apps/core/alembic.ini upgrade head
alembic-generate:
	docker exec -it proj-api alembic -c apps/core/alembic.ini revision --autogenerate -m "$(name)"
alembic-history:
	docker exec -it proj-api alembic -c apps/core/alembic.ini history

# === Poetry ===
poetry-lock:
	docker exec -it proj-api bash -c "cd /poetry/ && poetry lock"
poetry-add:
	docker exec -it proj-api bash -c "cd /poetry/ && poetry lock && poetry add $(package) --group $(group) && poetry lock"
poetry-remove:
	docker exec -it proj-api bash -c "cd /poetry/ && poetry lock && poetry remove $(package) && poetry lock"

# === Dev ===
tests:
	docker exec -it proj-api pytest ../tests/ -vvvs
lint:
	isort --sp setup.cfg src/ tests/ && \
	flake8 ./
pre-commit:
	docker exec -it proj-api pytest ../tests/ && \
	isort --sp setup.cfg src/ tests && \
	flake8 ./

# === Aliases ===
pc: pre-commit

-include $(CUSTOM_MAKEFILES)
