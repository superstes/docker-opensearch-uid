#!/bin/bash

set -euo pipefail

# edit and copy 'docker-compose.yml' to the target server
# define these vars:
#  os_version: '2.5.0'
#  os_user: 'opensearch'
#  os_user_id: '1200'
#  os_compose_file: '/etc/containers/opensearch.yml'

build_dir='/etc/containers/build_opensearch'

groupadd --gid "$os_user_id" "$os_user"
useradd --gid "$os_user_id" --gid "$os_user" "$os_user"

mkdir -p "$build_dir"

wget https://github.com/opensearch-project/docker-images/archive/refs/heads/main.zip -O "${build_dir}/main.zip"
cd "$build_dir"
unzip 'main.zip'

docker-compose -f "$os_compose_file" up
