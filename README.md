# description

* ensure replication of backup via cron
* monit this cron
* monit hosts (staging/prod)
* monit image. TODO: disk usage
* TODO: logrotate backups

# usage

## build

`$ infra/_docker-build.sh`

## run :

1. `$ cp infra/_docker-run.sh infra/_docker-run-with-env.sh`
2. replace the env vars
3. start: `$ infra/_docker-run-with-env.sh`

## connect

1. ssh: `$ infra/_docker-connect.sh`
2. ip from host to container: `$ open 0.0.0.0:8080`

## deploy

1. `$ infra/deploy.sh`

