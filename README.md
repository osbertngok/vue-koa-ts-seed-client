# vue-koa-ts-seed-client

## dev local run
```
yarn run serve
```
Configured to proxy server at `localhost:2333`.

## make docker image
```
./scripts/build_docker.sh
```

## run docker-compose
```
docker-compose -f /docker/docker-compose.yml up --force-recreate -d
```
