#!/bin/bash

pwd

if [ -n "$DATABASE_URL" ]; then
  # extract the protocol
  proto="$(echo "$DATABASE_URL" | grep :// | sed -e's,^\(.*://\).*,\1,g')"
  # remove the protocol
  url="$(echo "${DATABASE_URL/$proto/}")"
  # extract the user (if any)
  user="$(echo "$url" | grep @ | cut -d@ -f1)"
  # extract the host and port
  hostport="$(echo "${url/$user@/}" | cut -d/ -f1)"
  # by request host without port
  host="$(echo "$hostport" | sed -e 's,:.*,,g')"
  # by request - try to extract the port
  port="$(echo "$hostport" | sed -e 's,^.*:,:,g' -e 's,.*:\([0-9]*\).*,\1,g' -e 's,[^0-9],,g')"

  ./bin/wait-for-it.sh --host=$host --port=$port --timeout=60
fi

php ./bin/console doctrine:database:create -n --if-not-exists
php ./bin/console doctrine:migrations:migrate -n

echo "Starting main container command: $@"
exec "$@"
