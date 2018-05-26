#!/bin/bash

set -e

docker run \
    --rm \
    -v "$PWD":/usr/src/myapp \
    -w /usr/src/myapp \
    golang:1.10-alpine \
    sh -c 'apk add --no-cache git gcc musl-dev && go get -u golang.org/x/vgo && vgo build'

docker build -t ${IMAGE_PREFIX}go-neb:latest .
