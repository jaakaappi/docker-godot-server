#####################################################
# Dockerfile
#
# Creates an image with the Godot server app
#
# Build Args:
#   - GODOT_VERSION: The version of Godot
#

#------------------------------
# Alias for the root image
FROM debian:stable-slim AS base

ARG GODOT_VERSION=3.3.3

#------------------------------
# Installs packages to use wget
FROM base as wget

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    wget \
    unzip

#----------------
# Downloads Godot
FROM wget AS godot
RUN wget https://downloads.tuxfamily.org/godotengine/${GODOT_VERSION}/Godot_v${GODOT_VERSION}-stable_linux_server.64.zip
RUN unzip Godot_v${GODOT_VERSION}-stable_linux_server.64.zip
RUN mv Godot_v${GODOT_VERSION}-stable_linux_server.64 /usr/local/bin/godot
RUN rm Godot_v${GODOT_VERSION}-stable_linux_server.64.zip

ENTRYPOINT ["godot"]
CMD ["--help"]