#!/bin/bash

./bin/init-db.sh

echo "Starting main container command: $@"
exec "$@"
