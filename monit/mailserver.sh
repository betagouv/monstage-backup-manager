#!/bin/sh

SMTP_ADDRESS=${MONIT_SMTP_ADDRESS:-admin}
SMTP_USERNAME=${MONIT_SMTP_USERNAME:-changeit}
SMTP_PASSWORD=${MONIT_SMTP_PASSWORD:-changeit}
ALERTED_EMAIL=${MONIT_ALERTED_EMAIL:-fourcade.m@gmail.com}

echo "# Generated by start.sh" > /etc/monit/conf.d/mailserver.cfg

cat << EOF >> /etc/monit/conf.d/mailserver.cfg
# Generated by start.sh
set mailserver ${SMTP_ADDRESS} port 587
  username ${SMTP_USERNAME} password "${SMTP_PASSWORD}"
  using PLAIN with timeout 30 seconds
set alert ${ALERTED_EMAIL}
EOF
