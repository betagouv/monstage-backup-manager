#!/bin/bash
# info:
set -x
set -o nounset

docker run \
  --env CELLAR_ADDON_KEY_ID=xxx \
  --env CELLAR_ADDON_KEY_SECRET=xxx \
  --env CELLAR_ADDON_BUCKET=xxx \
  --env AWS_S3_ACCESS_KEY_ID=xxx \
  --env AWS_S3_SECRET_ACCESS_KEY=xxx \
  --env AWS_S3_BUCKET=xxx \
  --env SYNC_DIR=xxx \
  --env MONIT_AUTH_USERNAME=xxx \
  --env MONIT_AUTH_PASSWORD=xxx \
  --env MONIT_SMTP_ADDRESS=xxx \
  --env MONIT_SMTP_USERNAME=xxx \
  --env MONIT_SMTP_PASSWORD=xxx \
  --env MONIT_ALERTED_EMAIL=xxx \
  --env HOST=xxx \
  -it monstage/backup:1.0.4

