#!/bin/bash
sudo docker logout \
&& cat .rahasia/.dockerhub_token | sudo docker login --username herusasongko --password-stdin \
\
&& sudo docker run --rm --privileged docker/binfmt:a7996909642ee92942dcd6cff44b9b95f08dad64 \
\
&& sudo DOCKER_BUILDKIT=1 DOCKER_CLI_EXPERIMENTAL=enabled \
    docker buildx build \
      --platform linux/amd64,linux/arm64 \
      --push \
      -t herusasongko/cacti-multi-arch:1.2.16 \
      -t herusasongko/cacti-multi-arch:latest \
      . \
\
&& sudo docker logout