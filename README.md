# Docker Opensearch

This repo shows how to re-build the [official OpenSearch image](https://hub.docker.com/r/opensearchproject/opensearch) to use a custom UID + GID.

That can be useful if you need data-persistence (_using a volume_) and need to map a host-user to the user being used by the container.

The default image uses the UID/GID 1000.

## Options covered here

* Patch existing image (faster, easier)
  - [Dockerfile](https://github.com/superstes/docker-opensearch-uid/blob/main/Patch_Dockerfile)
  - [Docker-compose](https://github.com/superstes/docker-opensearch-uid/blob/main/Patch_docker-compose.yml)

* Re-Build official image
  - [Ansible + docker-compose](https://github.com/superstes/docker-opensearch-uid/blob/main/Rebuild_Ansible.yml)
  - [Bash + docker build](https://github.com/superstes/docker-opensearch-uid/blob/main/Rebuild_Bash+docker-build.sh)
  - [Bash + docker-compose](https://github.com/superstes/docker-opensearch-uid/blob/main/Rebuild_Bash+docker-compose.sh)
