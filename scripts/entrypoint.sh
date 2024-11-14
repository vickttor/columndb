#!/bin/bash
cp /scripts/cassandra.yaml /etc/cassandra/cassandra.yaml
exec /usr/local/bin/docker-entrypoint.sh "$@"