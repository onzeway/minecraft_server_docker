FROM java:7

MAINTAINER Mathieu POTIER <mathieu.potier@onzeway.eu>

LABEL Description="This image provide Minecraft server container" Vendor="Onzeway" Version="1.0.0"

ENV SERVER_NAME "minecraft"
ENV MSM_VERSION "1.7.0"

RUN apt-get update \
    && apt-get install -y \
        apt-utils

RUN apt-get update \
    && apt-get install -y \
        screen \
        rsync \
        zip

COPY ./etc/msm.conf /etc/msm.conf
COPY ./bin/msm /usr/local/bin/msm
COPY ./initscript /usr/local/initscript

RUN mkdir -p /opt/msm

RUN useradd minecraft --home /opt/msm && chown minecraft /opt/msm && chmod -R 775 /opt/msm
RUN chmod 755 /usr/local/bin/msm
RUN chmod 755 /usr/local/initscript

EXPOSE 25565

VOLUME ["/opt/msm/servers"]

CMD ["/usr/local/initscript"]

# docker run -d --name=minecraft --restart=unless-stopped -v $PWD/servers:/opt/msm/servers -p 25565:25565 -e SERVER_NAME="minecraft" -e MSM_VERSION="1.7.0" onzeway/minecraft_server_docker:latest
