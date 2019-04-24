#!/bin/bash

TAG="teebor/fastnetmon${VERSION:+:${VERSION}}"

set -x
docker build . \
    --no-cache \
    -t "$TAG" \
    --build-arg version="${VERSION:-master}"

image_id=$(docker images "$TAG" --format "{{.ID}}")

docker run --rm --entrypoint 'echo "Hello!"' "$image_id"
