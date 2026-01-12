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
	bundle pack
	docker compose exec web bundle install --local
	touch tmp/restart

db_recreate:
	find storage -mindepth 1 -maxdepth 1 -type d  -print0 | xargs -0 /bin/rm -rf
	docker compose restart web
	docker compose exec web rails db:drop
	rm -f db/schema.rb
	docker compose exec web rails db:create
	docker compose exec web rails db:migrate
	docker compose exec web rails db:seed
	docker compose exec web rails searchkick:reindex:all

db_create:
	docker compose exec web rails db:create

db_migrate:
	docker compose exec web rails db:migrate

db_seed:
	docker compose exec web rails db:seed -vvv --trace
	docker compose exec web rails searchkick:reindex:all

search_reindex_all:
	docker compose exec web rails searchkick:reindex:all

search_reindex:
	docker compose exec web rails searchkick:reindex CLASS=Book
	docker compose exec web rails searchkick:reindex CLASS=ContentTagFamily
	docker compose exec web rails searchkick:reindex CLASS=ContentTag
	docker compose exec web rails searchkick:reindex CLASS=Content

annotate:
	docker compose exec web annotaterb models
	docker compose exec web annotaterb routes

sass_watch:
	rails dartsass:watch

rspec:
	docker compose exec web rspec -fd

clear_cache:
	docker compose exec web rails tmp:cache:clear

optimize_db:
	docker compose exec web lol_dba db:find_indexes
