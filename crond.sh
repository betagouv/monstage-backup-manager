#!/bin/bash
# info:
#   at startup, export required env var from docker container within a `container.env`
#   later this `container.env` will be sourced by our `crontask` otherwise env var not available
# reason: https://stackoverflow.com/questions/27771781/how-can-i-access-docker-set-environment-variables-from-a-cron-job

declare -p | grep -E 'CELLAR_ADDON_KEY_ID|CELLAR_ADDON_KEY_SECRET|CELLAR_ADDON_BUCKET|AWS_S3_ACCESS_KEY_ID|AWS_S3_SECRET_ACCESS_KEY|AWS_S3_BUCKET|SYNC_DIR' > /container.env

# run cron
cron

# expose a simple http server to keep docker alive and make it monitorable
mkdir /www
echo 'OK' > /www/index.html
while true ; do    printf 'HTTP/1.1 200 OK\n\n%s' "$(cat /www/index.html)" | netcat -l 8080; done

