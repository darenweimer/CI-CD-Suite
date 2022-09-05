#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# Startup the Nginx reverse proxy server
#-------------------------------------------------------------------------------

docker compose -f nginx-proxy/docker-compose.yml up -d

#-------------------------------------------------------------------------------
# Startup additional software
#-------------------------------------------------------------------------------

docker compose -f jenkins/docker-compose.yml -f jenkins/docker-compose.override.yml up -d
docker compose -f redmine/docker-compose.yml -f redmine/docker-compose.override.yml up -d
docker compose -f vault/docker-compose.yml -f vault/docker-compose.override.yml up -d
