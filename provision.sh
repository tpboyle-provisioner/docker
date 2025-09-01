#!/bin/bash


# LOCATE PROJECT ROOT

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# SOURCES

source "src/logger.sh"
source "$DIR/apps/_installer.sh"

[ -f "$DIR/conf.sh" ] && source "$DIR/conf.sh"


# HELPERS

log_header () {
  info "development" "---- Starting <<DOCKER>> provisioning... ----"
}

log_footer () {
  info "development" "---- ...<<DOCKER>> provisioning complete. ----"
}


# INTERFACE

provision () {
  docker_is_provisioned
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

