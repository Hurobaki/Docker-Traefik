#!/bin/bash

DOCKER=$(which docker)

if [ "x${DOCKER}y" = "xy" ]
then
	echo "=== docker command was not found ==="
	exit 1
fi

echo "Which domain for Traefik dashboard ?"

read domain_name

docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD/traefik.toml:/traefik.toml \
  -v $PWD/acme.json:/acme.json \
  -e TZ="Europe/Paris" \
  -p 80:80 \
  -p 443:443 \
  -l traefik.frontend.rule=Host:${domain_name} \
  -l traefik.port=8080 \
  --network proxy \
  --name traefik \
  traefik:latest --docker --logLevel=DEBUG
