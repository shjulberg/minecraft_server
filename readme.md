Here's what each line does:

FROM openjdk:8-jdk-alpine - This selects the official OpenJDK 8 Docker image based on Alpine Linux as the base image for our Minecraft server container.
LABEL maintainer="Your Name <your.email@example.com>" - This sets the metadata for the container, including the maintainer's name and email.
ENV TZ=UTC - This sets the timezone to UTC for the container.
ENV MINECRAFT_VERSION=1.17.1 - This sets the Minecraft version to download and run.
WORKDIR /minecraft-server - This sets the working directory inside the container to /minecraft-server.
RUN apk add --no-cache curl && \ curl -sSL https://launcher.mojang.com/v1/objects/1a2ebe2c1e2b4d0523294af160b74fb3e6b35f00/server.jar \ -o server.jar && \ echo "eula=true" > eula.txt && \ addgroup -S minecraft && \ adduser -S -G minecraft minecraft && \ chown -R minecraft:minecraft /minecraft-server - This runs a series of commands inside the container to download the Minecraft server jar, accept the Minecraft EULA, create a user and group named "minecraft" with appropriate permissions, and set the ownership of the /minecraft-server directory to the minecraft user.
USER minecraft - This sets the user to the "minecraft" user.
EXPOSE 25565 - This exposes port 25565, which is the default Minecraft server port.
CMD ["java", "-Xmx2G", "-Xms2G", "-jar", "server.jar", "nogui"] - This specifies the command to run when the container starts, which starts the Minecraft server with 2GB of memory and without a GUI


To build:

docker build -t minecraft-server .

This will build the Docker image and tag it with the name "minecraft-server". To run the container, use the following command:


docker run -d -p 25565:25565 --name minecraft-server minecraft-server

This will start the container in detached mode, map the container's port 25565 to the host's port 25565, and name the container "minecraft-server".
