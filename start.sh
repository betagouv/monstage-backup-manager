#!/bin/bash
# info:
#   at startup, setup cron
#   1. export required env var from docker container within a `container.env`
#   2. later this `container.env` will be sourced by our `crontask` otherwise env var not available
# reason: https://stackoverflow.com/questions/27771781/how-can-i-access-docker-set-environment-variables-from-a-cron-job

declare -p | grep -E 'CELLAR_ADDON_KEY_ID|CELLAR_ADDON_KEY_SECRET|CELLAR_ADDON_BUCKET|AWS_S3_ACCESS_KEY_ID|AWS_S3_SECRET_ACCESS_KEY|AWS_S3_BUCKET|SYNC_DIR' > /cron/container.env

# source monit env
/monit/1_httpd.sh
/monit/2_alert.sh
/monit/3_cron.sh

# run cron via monit
monit -I
