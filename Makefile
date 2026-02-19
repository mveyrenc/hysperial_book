# Based on https://gist.github.com/gambala/4874e2b41a52ac043a274a61f5d7726b
#
# There's nothing here you can't do the long way. This is just a collection of (hopefully intuitive) shortcuts
# to ease common development tasks and serve as a reference.
#
# To use this file:
#
#   $ make <target command> <any arguments>
#
#
#
# run-ARGS
#
# run-ARGS allows you to run make commands with any set of arguments.
#
# For example, these lines are the same:
#   > make g devise:install
#   > bundle exec rails generate devise:install
# And these:
#   > make add-migration add_deleted_at_to_users deleted_at:datetime
#   > bundle exec rails g migration add_deleted_at_to_users deleted_at:datetime
# And these:
#   > make add-model Order user:references record:references{polymorphic}
#   > bundle exec rails g model Order user:references record:references{polymorphic}
run-ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

# If nothing is passed, show the help
.DEFAULT_GOAL := help

install: ## Install everything
	chmod +x ./docker/entrypoints/rails.sh docker/entrypoints/helpers/pg_database_url.sh
	docker compose build $(run-ARGS)
	yarn install
	docker compose up -d
	docker compose exec web rails db:create
	docker compose exec web rails db:migrate
	docker compose exec web rails db:seed
	docker compose exec web rails searchkick:reindex:all

###Docker: ## .
docker-build: ## Build project docker images
	docker compose build

docker-ls: ## List running containers
	docker compose ps

docker-up: ## Start containers
	docker compose up -d

docker-stop: ## Stop containers
	docker compose stop

docker-recreate-web: # Remove and recreate web container
	docker compose stop web
	docker compose rm web
	docker compose up -d

docker-restart-web: # Restart web container
	docker compose restart web

docker-logs-web: ## Display `web` container logs
	docker compose logs web

###Dependency-Commands: ## .
ruby-install: ## Gets ruby dependencies up to date
	bundle check || bundle install
	docker compose exec web bundle install
	docker compose exec web rails restart

yarn-install: ## Gets js dependencies up to date
	yarn install
	docker compose exec web yarn install

yarn-install-hard: ## Remove existing node_modules and install js dependencies anew
	rm -rf node_modules
	yarn install
	docker compose exec web yarn install

install: ruby-install yarn-install ## Updates all our dependencies

###Rails-Commands: ## .
db-recreate: ## Recreate nd seed database and storage folder
	find storage -mindepth 1 -maxdepth 1 -type d  -print0 | xargs -0 /bin/rm -rf
	docker compose exec web rails db:drop
	rm -f db/schema.rb
	docker compose exec web rails db:create
	docker compose exec web rails db:migrate
	docker compose exec web rails db:seed
	docker compose exec web rails searchkick:reindex:all

db-create: ## Create the database
	docker compose exec web rails db:create

db-migrate: ## Run database migrations
	docker compose exec web rails db:migrate

db-seed: ## Seed database
	docker compose exec web rails db:seed --trace
	docker compose exec web rails searchkick:reindex:all

search-reindex-all: ## Refresh all search index
	docker compose exec web rails searchkick:reindex:all

search-reindex: ## Refresh a given search index
	docker compose exec web rails searchkick:reindex CLASS=$(run-ARGS)

annotate: ## Annotate models and routes
	docker compose exec web annotaterb models
	docker compose exec web annotaterb routes

sass-watch: ## Watch for change in SASS and build CSS
	rails dartsass:watch

clear-cache: ## Clear Rails cache
	docker compose exec web rails tmp:cache:clear

optimize-db: ## Optimize database
	docker compose exec web lol_dba db:find_indexes

###Tests: ## .
clean-test-db: ## Clear and recreate test database
	docker compose exec -e RAILS_ENV=test web rails  db:drop
	docker compose exec -e RAILS_ENV=test web rails  db:create
	docker compose exec -e RAILS_ENV=test web rails  db:migrate

run-test: ## Runs the provided test(s)
	docker compose exec -e RAILS_ENV=test web rails  db:create
	docker compose exec -e RAILS_ENV=test web rails  db:migrate
	docker compose exec -e RAILS_ENV=test web rails  test $(run-ARGS)

run-system-test: ## Runs the provided system test(s)
	docker compose exec -e RAILS_ENV=test web rails  test:system $(run-ARGS)

run-controllers-test: ## Runs the provided controller test(s)
	docker compose exec -e RAILS_ENV=test web rails  test:controllers $(run-ARGS)

run-libs-test: ## Runs the provided controller test(s)
	docker compose exec -e RAILS_ENV=test web rails  test test/lib

###Linting-Commands: ## .
lint-ruby: ## Run ruby syntax clean up
	bundle exec rubocop -a

lint-audit: ## Run ruby security checks
	brakeman
	bundle exec ruby-audit check
	bundle-audit update; bundle-audit chec

###: ## .
# Self-documented makefile from https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:  ## Shows help
	@grep -E '^[#\ a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; { split($$1, C, " "); printf "\033[36m%-30s\033[0m %s\n", C[1], $$2}'
