#!/bin/sh

MONIT_USERNAME=${MONIT_USERNAME:-admin}
MONIT_PASSWORD=${MONIT_PASSWORD:-changeit}

echo "# Generated by start.sh" > /etc/monit/conf.d/1_httpd.cfg

cat << EOF >> /etc/monit/conf.d/1_httpd.cfg
# Generated by start.sh
set httpd
    port 8080
    use address 0.0.0.0
    allow ${MONIT_USERNAME}:${MONIT_PASSWORD}
EOF
