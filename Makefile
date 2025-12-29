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
	bundle package
	docker compose exec web bundle install --local

db_recreate:
	docker compose restart web
	docker compose exec web rails db:drop
	rm db/schema.rb
	docker compose exec web rails db:create
	docker compose exec web rails db:migrate
	docker compose exec web rails db:seed --trace

db_create:
	docker compose exec web rails db:create

db_migrate:
	docker compose exec web rails db:migrate

db_seed:
	docker compose exec web rails db:seed -vvv --trace

search_reindex_all:
	docker compose exec web rails searchkick:reindex:all

search_reindex:
	docker compose exec web rails searchkick:reindex CLASS=Book
	docker compose exec web rails searchkick:reindex CLASS=ContentTagFamily
	docker compose exec web rails searchkick:reindex CLASS=ContentTag

annotate:
	docker compose exec web annotate --model

sass_watch:
	rails dartsass:watch

rspec:
	docker compose exec web rspec

clear_cache:
	docker compose exec web rails tmp:cache:clear

