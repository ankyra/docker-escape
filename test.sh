#!/bin/bash -e

docker run -t $INPUT_docker_repository$INPUT_docker_image:latest -- escape version
