#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# Shutdown the Nginx reverse proxy server
#-------------------------------------------------------------------------------

docker compose -f nginx-proxy/docker-compose.yml down

#-------------------------------------------------------------------------------
# Shutdown additional software
#-------------------------------------------------------------------------------

docker compose -f jenkins/docker-compose.yml -f jenkins/docker-compose.override.yml down
docker compose -f redmine/docker-compose.yml -f redmine/docker-compose.override.yml down
