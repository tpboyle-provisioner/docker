#!/bin/bash


# LOCATE PROJECT ROOT

DOCKER_MODULE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# SOURCES

source "src/logger.sh"
source "$DOCKER_MODULE_DIR/apps/_all.sh"


# HELPERS

log_header () {
  info "docker" "Starting _docker_ provisioning..."
}

log_footer () {
  info "docker" "..._docker_ provisioning complete."
}


# INTERFACE

provision () {
  provision_all_docker_apps
}


# MAIN

main () {
  log_header
  provision
  log_footer
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  main "$@"
fi

