#!/bin/bash -e

IMAGE=$INPUT_docker_repository$INPUT_docker_image:latest

if [ "$INPUT_docker_repository" = "" ] ; then
  IMAGE="$INPUT_docker_image:latest"
fi

echo "Running 'escape version' on image to validate binary is correctly installed"
docker run --rm -t "$IMAGE" version
