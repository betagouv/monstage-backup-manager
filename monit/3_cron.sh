cat << EOF >> /etc/monit/conf.d/cron.cfg
# Generated by start.sh
check process cron with pidfile /var/run/crond.pid
  group system
  start program = "/etc/init.d/cron start"
  stop  program = "/etc/init.d/cron stop"
  if 5 restarts within 5 cycles then timeout
EOF
