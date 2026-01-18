#!/bin/sh

set -x

# Remove a potentially pre-existing server.pid for Rails.
rm -rf ${APP_DIR}/tmp/pids/server.pid
rm -rf ${APP_DIR}/tmp/cache/*

echo "Waiting for postgres to become ready...."

# Let DATABASE_URL env take presedence over individual connection params.
# This is done to avoid printing the DATABASE_URL in the logs
$(docker/entrypoints/helpers/pg_database_url.sh)
PG_READY="pg_isready --host=$POSTGRES_HOST --port=${POSTGRES_PORT:-5432} --username=$POSTGRES_USERNAME"

until $PG_READY
do
  sleep 2;
done

echo "Database ready to accept connections."

bundle install

BUNDLE="bundle check"

bundle exec rails db:create && bundle exec rails db:migrate

until $BUNDLE
do
  sleep 2;
done

# Execute the main process of the container
exec "$@"
