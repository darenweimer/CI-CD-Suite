#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# Launch the Nginx reverse proxy server
#-------------------------------------------------------------------------------

docker compose -f nginx-proxy/docker-compose.yml up -d

#-------------------------------------------------------------------------------
# Launch additional software
#-------------------------------------------------------------------------------

docker compose -f jenkins/docker-compose.yml -f jenkins/docker-compose.override.yml up -d
