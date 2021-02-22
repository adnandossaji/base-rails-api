SERVICE?=api
DATABASE?=db
DC_FILE?=docker-compose.yml

bash:
	docker-compose -f $(DC_FILE) exec $(SERVICE) bash

test_bash:
	docker-compose -f $(DC_FILE) exec -e RAILS_ENV=test $(SERVICE) bash

mysql:
	docker-compose -f $(DC_FILE) exec $(DATABASE) mysql -u root

build:
	docker-compose -f $(DC_FILE) build --pull

pull:
	docker-compose -f $(DC_FILE) pull

up:
	docker-compose -f $(DC_FILE) up -d

down:
	docker-compose -f $(DC_FILE) down

create_db:
	docker-compose -f $(DC_FILE) run --rm $(SERVICE) rails db:create

setup_db:
	docker-compose -f $(DC_FILE) run --rm $(SERVICE) rails db:setup

migrate_db:
	docker-compose -f $(DC_FILE) run --rm $(SERVICE) rails db:migrate

build_db: create_db setup_db migrate_db

routes:
	docker-compose -f $(DC_FILE) run --rm $(SERVICE) rails routes
