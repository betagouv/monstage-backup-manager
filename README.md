# README
## Purpose, backup replication
Ensures a replication of our db backups from clevercloud to aws.s3 (in case clevercloud is down [ex: a fire destroy the datacenter], we do have a replica of our database that we can fetch).

The process to replicate the backup is done everyday with a cron job, see the [crontask](https://github.com/betagouv/monstage-backup-manager/blob/main/cron/crontask) which is scheduled everyday at midnight and execute the [backup.sh](https://github.com/betagouv/monstage-backup-manager/blob/main/cron/backup.sh).

We use a simple aws-cli to fetch the backup from clever and push them to aws.s3.


## Packaging, with docker

This software is packaged within a docker image, described by our [Dockerfile](https://github.com/betagouv/monstage-backup-manager/blob/main/Dockerfile), then it execute our entrypoint  [start.sh](https://github.com/betagouv/monstage-backup-manager/blob/main/start.sh).

In order to ensure that our software runs, we use monit to supervize cron.

## Supervize, with monit

considering we are delegating the backups replication to cron, we do supervize cron with monit, plus :
1. supervize the cron process with [monit/cron.cfg](https://github.com/betagouv/monstage-backup-manager/blob/main/monit/cron.cfg)
2. keep disk space available with [monit/disk-usage.sh](https://github.com/betagouv/monstage-backup-manager/blob/main/monit/disk-usage.sh) (>50% usage -> alert)

## Make monit available with monit httpd
Nothing special here, just that our monit is accessible via $HOST, and just in case, it's basic auth protected with $MONIT_AUTH_USERNAME:$MONIT_AUTH_PASSWORD.

## Environment
This software is hosted by clevercloud, just remember to setup expected environment variables

# Build & Run

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

