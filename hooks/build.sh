#!/bin/bash

TAG="teebor/fastnetmon${VERSION:+:${VERSION}}"

remote=$(git remote | head -n)

set -x
docker build \
    -t "$TAG" \
    --build-arg VCS_REF="$(git rev-parse --short HEAD)" \
    --build-arg VCS_URL="$(git config --get "remote.$remote.url")" \
    --build-arg BUILD_DATE="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg VERSION="${VERSION:-latest}" \
    --no-cache \
    .

image_id=$(docker images "$TAG" --format "{{.ID}}")

docker run --rm --entrypoint /bin/bash "$image_id" -c ls

docker images
