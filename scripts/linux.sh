#!/bin/bash

# Enters into my ubuntu container

if ! colima status 2> /dev/null; then
  echo "Starting colima"
  colima start 2> /dev/null # start if not already
fi

docker-compose -f ~/ubuntu/docker-compose.yml up -d;

docker exec -u 0 -it dev-ubuntu bash;
