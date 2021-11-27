FROM ubuntu:14.04

ENV MXB_BACKUP_VOLUMES /backup

# Copy the entrypoint-script and the emulator needed for autobuild function of DockerHub
RUN apt-get update -y && apt-get install -y wget nano
COPY entrypoint.sh /usr/bin/
RUN wget https://cdn.cloudbackup.management/maxdownloads/mxb-linux-x86_64.run
RUN mv mxb-linux-x86_64.run /root/mxb-linux-x86_64.run
RUN chmod +x /root/mxb-linux-x86_64.run

# Making entrypoint-script executable
RUN chmod +x /usr/bin/entrypoint.sh

# Only files in /backup will be backed up per default
VOLUME [ "/backup" ]
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
