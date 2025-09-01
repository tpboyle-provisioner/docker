
source "src/packages/apt.sh"
source "src/services.sh"

APT_REPO_URL="https://download.docker.com/linux/ubuntu"
APT_KEY_URL="$APT_REPO_URL/gpg"

docker_is_provisioned () {
  docker_requirements_are_installed
  apt_ensure_key_is_installed docker "$APT_KEY_URL"
  apt_ensure_sources_file_exists docker "$APT_REPO_URL"
  docker_packages_are_installed
  ensure_service_is_active docker
}

docker_requirements_are_installed () {
  apt_ensure_packages_are_installed \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
}

docker_packages_are_installed () {
  apt_ensure_packages_are_installed \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin
}
