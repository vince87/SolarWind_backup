FROM ubuntu:14.04

ENV MXB_CLIENT_PORT 55415
ENV MXB_BACKUP_VOLUMES /backup

# Copy the entrypoint-script and the emulator needed for autobuild function of DockerHub
COPY entrypoint.sh /usr/bin/
COPY mxb-linux-x86_64.run /root/

RUN apt-get update -y && apt-get install -y wget nano

# Making entrypoint-script executable
RUN chmod +x /usr/bin/entrypoint.sh

# Only files in /backup will be backed up per default
VOLUME [ "/backup" ]
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
