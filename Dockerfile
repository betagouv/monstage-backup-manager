FROM ubuntu:trusty

# install unix dependencies
RUN apt-get update && apt-get install wget unzip cron monit -y

# install aws cli dependency
RUN wget -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
RUN mv awscli-exe-linux-x86_64.zip awscliv2.zip
RUN unzip -qq awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip

# add our crontask
COPY ./crontask /etc/cron.d/crontask
RUN chmod 0644 /etc/cron.d/crontask
RUN crontab /etc/cron.d/crontask

# add our backup script ran by the crontask
COPY ./backup.sh /root/backup.sh

# use custom "start.sh which prepare a container.env file for our crontask"
COPY ./start.sh /root/start.sh


COPY ./monit/1_httpd.sh /root/1_httpd.sh

# run this `start.sh` (running cron in foreground)
CMD /root/start.sh
