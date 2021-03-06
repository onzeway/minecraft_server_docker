# Minecraft Server Docker
Minecraft Server Docker image based on Minecraft Server Manager

[![](https://images.microbadger.com/badges/image/onzeway/minecraft_server_docker.svg)](http://microbadger.com/images/onzeway/minecraft_server_docker "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/onzeway/minecraft_server_docker.svg)](http://microbadger.com/images/onzeway/minecraft_server_docker "Get your own version badge on microbadger.com")

## Description
Based on MSM HQ team work : http://msmhq.com/
This container exposes its 25565 TCP/port to allow minecraft client connection.

## Source
https://github.com/onzeway/minecraft_server_docker

## Usage
```
docker pull onzeway/minecraft_server_docker:latest
```

```
docker run -d --name=minecraft --restart=unless-stopped -v $PWD/servers:/opt/msm/servers -p 25565:25565 -e SERVER_NAME="minecraft" -e MSM_VERSION="1.7.0" onzeway/minecraft_server_docker:latest
```
Don't forget to edit the EULA text file to allow the server to start at first time :
$PWD/servers/eula.txt

```
#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula).
#Wed Aug 24 18:45:29 UTC 2016
eula=false
```

Changing eula=false to eula=true and restart container ...

For advanced usage refer to : http://msmhq.com/docs/
