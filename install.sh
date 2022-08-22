#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# Update the Ubuntu Server apt repository
#-------------------------------------------------------------------------------

apt update
apt upgrade -y

#-------------------------------------------------------------------------------
# Install required system commands
#-------------------------------------------------------------------------------

apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#-------------------------------------------------------------------------------
# Add Docker's official GPG key
#-------------------------------------------------------------------------------

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

#-------------------------------------------------------------------------------
# Setup the Docker repository
#-------------------------------------------------------------------------------

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

#-------------------------------------------------------------------------------
# Install the Docker engine
#-------------------------------------------------------------------------------

apt update

apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

#-------------------------------------------------------------------------------
# Create the network for the Nginx reverse proxy server
#-------------------------------------------------------------------------------

docker network create nginx-proxy
