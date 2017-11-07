#!/bin/bash -e

IMAGE=$INPUT_docker_repository$INPUT_docker_image:latest

if [ "$INPUT_docker_repository" = "" ] ; then
  IMAGE="$INPUT_docker_image:latest"
fi

docker run --rm -t "$IMAGE" -- escape version
