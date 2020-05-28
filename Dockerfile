# Use Alpine as base image.
FROM alpine:latest

# Environment Vars
ENV PUID 1000
ENV PGID 1000
ENV SAMBAUSER sambauser
ENV SAMBAPASS sambapass

# Update Alpine and pull samba and the tools required.
RUN apk --no-cache upgrade && apk add --no-cache samba-server samba-common-tools

# Add s6-Overlay.
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz /tmp
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Copy the configuration files to the image.
COPY root/ /

# Expose the ports required by smbd & nmbd.
EXPOSE 137/udp 138/udp 139/tcp 445/tcp

# Init.
CMD ["/init"]
