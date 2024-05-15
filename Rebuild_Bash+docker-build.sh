#!/bin/bash

set -euo pipefail

# define these vars:
#  os_version: '2.5.0'
#  os_user: 'opensearch'
#  os_user_id: '1200'

build_dir='/etc/containers/build_opensearch'

groupadd --gid "$os_user_id" "$os_user"
useradd --gid "$os_user_id" --gid "$os_user" "$os_user"

mkdir -p "$build_dir"

wget https://github.com/opensearch-project/docker-images/archive/refs/heads/main.zip -O "${build_dir}/main.zip"
cd "$build_dir"
unzip 'main.zip'

docker build -t "local/opensearch:${os_version}" --build-tag="UID=$os_user_id" --build-tag="GID=$os_user_id" --build-tag="OS_VERSION=$os_version" -f "$build_dir/docker-images-main/2.x/Dockerfile" "$build_dir/docker-images-main/2.x"
