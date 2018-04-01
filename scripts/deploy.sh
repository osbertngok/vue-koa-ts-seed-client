#!/usr/bin/env bash

CURR_FILE_DIR=`dirname $0`
PROJECT_DIR=${CURR_FILE_DIR}/..

DEST=root@test-sgp-01

# poor man's docker hub
# prefer to use hub if needs to be done multiple times, as docker pull can utilize layers that are already pulled
docker save vue_koa_ts_seed_client:latest | bzip2 | pv | ssh ${DEST} 'bunzip2 | docker load'
docker save vue_koa_ts_seed_server:latest | bzip2 | pv | ssh ${DEST} 'bunzip2 | docker load'

ssh ${DEST} 'mkdir -p /opt/main/ops_web'
scp ${PROJECT_DIR}/docker/docker-compose.yml ${DEST}:/opt/main/ops_web/
scp ${PROJECT_DIR}/docker/CaddyFile ${DEST}:/opt/main/ops_web/
ssh ${DEST} "sudo docker-compose -f /opt/main/ops_web/docker-compose.yml up --force-recreate -d"
