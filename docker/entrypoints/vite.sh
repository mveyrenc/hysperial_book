#!/bin/sh

set -x

yarn install

# Execute the main process of the container
exec "$@"
