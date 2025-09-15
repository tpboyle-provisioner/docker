#!/bin/bash


# SOURCE

source "src/packages/apt/sources.sh"
source "src/packages/apt/keyrings.sh"
source "src/packages/apt/repositories.sh"
source "src/packages/apt/packages.sh"
source "src/services.sh"


# CONSTANTS

APT_REPO_URL="https://download.docker.com/linux/ubuntu"
APT_KEY_URL="$APT_REPO_URL/gpg"


# INTERFACE

ensure_docker_is_provisioned () {
  ensure_docker_requirements_are_installed
  apt_ensure_key_is_installed docker "$APT_KEY_URL"
  apt_ensure_sources_file_exists docker "$APT_REPO_URL"
  ensure_docker_packages_are_installed
  # ensure_service_is_active docker
}


# IMPLEMENTATION

ensure_docker_requirements_are_installed () {
  apt_ensure_packages_are_installed \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
}

ensure_docker_packages_are_installed () {
  apt_ensure_packages_are_installed \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin
}
