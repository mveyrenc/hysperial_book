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
	docker compose exec web bundle install

db_migrate:
	docker compose exec web rails db:migrate

rspec:
	docker compose exec web rspec

