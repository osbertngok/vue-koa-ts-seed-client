#!/usr/bin/env bash

CURR_FILE_DIR=`dirname $0`
PROJECT_DIR=${CURR_FILE_DIR}/../
PROJECT_NAME=vue_koa_ts_seed_client
COMMIT_SHA=`git rev-parse --verify HEAD`
COMMIT_SHA_SHORT=${COMMIT_SHA:0:8}
DOCKER_IMAGE_LATEST=${PROJECT_NAME}:latest
DOCKER_IMAGE_WITH_VERSION=${PROJECT_NAME}:${COMMIT_SHA_SHORT}

cd ${PROJECT_DIR}

# preparation for building

# comment this to speed up, but probably should enable for prod
# yarn cache clean
rm -rf node_modules/ && yarn
yarn run build

# build and tag latest
docker build -t ${DOCKER_IMAGE_WITH_VERSION} -f docker/DockerFile .
docker tag ${DOCKER_IMAGE_WITH_VERSION} ${DOCKER_IMAGE_LATEST}
