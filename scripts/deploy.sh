#!/usr/bin/env bash
# poor man's docker hub
# prefer to use hub if needs to be done multiple times, as docker pull can utilize layers that are already pulled
docker save vue_koa_ts_seed_client:latest | bzip2 | pv | ssh root@test-sgp-01 'bunzip2 | docker load'
docker save vue_koa_ts_seed_server:latest | bzip2 | pv | ssh root@test-sgp-01 'bunzip2 | docker load'

# the following is better to be handled with ansible, but just for simplicity:

