FROM ubuntu:latest

# install unix dependencies
RUN apt-get update && apt-get install wget unzip cron monit -y

# install aws cli dependency
RUN wget -q "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip"
RUN mv awscli-exe-linux-x86_64.zip awscliv2.zip
RUN unzip -qq awscliv2.zip
RUN ./aws/install
RUN rm awscliv2.zip

# add our crontask
RUN mkdir /cron
COPY ./cron/backup.sh /cron/backup.sh
COPY ./cron/crontask /etc/cron.d/crontask
RUN chmod 0644 /etc/cron.d/crontask
RUN crontab /etc/cron.d/crontask


# use custom "start.sh which prepare a container.env file for our crontask"
COPY ./start.sh /root/start.sh


RUN mkdir /monit
COPY ./monit/httpd.sh /monit/httpd.sh
COPY ./monit/alert.sh /monit/alert.sh
COPY ./monit/cron.cfg /etc/monit/conf.d/cron.cfg
COPY ./monit/daemon.cfg /etc/monit/conf.d/daemon.cfg
COPY ./monit/remote.cfg /etc/monit/conf.d/remote.cfg

# run this `start.sh` (running cron in foreground)
CMD /root/start.sh
