FROM openjdk:8-jdk-alpine

LABEL maintainer="Your Name <your.email@example.com>"

ENV TZ=UTC
ENV MINECRAFT_VERSION=1.17.1

WORKDIR /minecraft-server

RUN apk add --no-cache curl && \
    curl -sSL https://launcher.mojang.com/v1/objects/1a2ebe2c1e2b4d0523294af160b74fb3e6b35f00/server.jar \
    -o server.jar && \
    echo "eula=true" > eula.txt && \
    addgroup -S minecraft && \
    adduser -S -G minecraft minecraft && \
    chown -R minecraft:minecraft /minecraft-server

USER minecraft

EXPOSE 25565

CMD ["java", "-Xmx2G", "-Xms2G", "-jar", "server.jar", "nogui"]
