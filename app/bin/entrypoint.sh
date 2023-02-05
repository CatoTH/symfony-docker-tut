#!/bin/bash

COMPOSER_ALLOW_SUPERUSER=1 /usr/local/bin/composer install

./bin/init-db.sh

echo "Starting main container command: $@"
exec "$@"
