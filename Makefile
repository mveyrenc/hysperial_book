docker_build:
	docker compose build

docker_ls:
	docker compose ps

docker_up:
	docker compose up -d

docker_stop:
	docker compose stop

web_logs:
	docker compose logs web

bundle_install:
	bundle install
	bundle package --all
	docker compose exec web bundle install --local

db_recreate:
	docker compose restart web
	docker compose exec web rails db:drop
	docker compose exec web rails db:create
	docker compose exec web rails db:migrate
	docker compose exec web rails db:seed --trace

db_create:
	docker compose exec web rails db:create

db_migrate:
	docker compose exec web rails db:migrate

annotate:
	docker compose exec web annotate --model

sass_watch:
	rails dartsass:watch

rspec:
	docker compose exec web rspec

