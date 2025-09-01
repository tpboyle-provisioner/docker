
DOCKER_APPS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DOCKER_APPS_DIR/docker.sh"

provision_all_docker_apps () {
  docker_is_provisioned
}
