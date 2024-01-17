DC = docker compose
EXEC = docker exec -it
LOGS = docker logs
ENV = --env-file .env

STORAGES_FILE = docker_compose/storages.yaml
DB_CONTAINER = postgres
APP_FILE = docker_compose/app.yaml
APP_CONTAINER = main-app

MANAGE_PY = python manage.py

# -----------------------Storages--------------------------------
.PHONY: storages
storages:
	${DC} -f ${STORAGES_FILE} ${ENV} up -d

.PHONY: storages-down
storages-down:
	${DC} -f ${STORAGES_FILE} down

.PHONY: postgres-cli
postgres-cli:
	${EXEC} ${DB_CONTAINER} psql -h postgres -p 5432 -U postgres -d postgres

.PHONY: storages-logs
storages-logs:
	${LOGS} ${DB_CONTAINER} -f
# -----------------------Application--------------------------------
.PHONY: app
app:
	${DC} -f ${STORAGES_FILE} -f ${APP_FILE} ${ENV} up --build -d

.PHONY: app-logs
app-logs:
	${LOGS} ${APP_CONTAINER} -f

.PHONY: app-down
app-down:
	${DC} -f ${STORAGES_FILE} -f ${APP_FILE} ${ENV} down

# ----------------------Django----------------
.PHONY: migrate
migrate:
	${EXEC} ${APP_CONTAINER} python manage.py migrate

.PHONY: makemigrations
makemigrations:
	${EXEC} ${APP_CONTAINER} python manage.py makemigrations

.PHONY: createsuperuser
createsuperuser:
	${EXEC} ${APP_CONTAINER} python manage.py createsuperuser

.PHONY: collectstatic
collectstatic:
	${EXEC} ${APP_CONTAINER} python manage.py collectstatic
