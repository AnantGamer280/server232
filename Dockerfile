# Use Ubuntu as base image
FROM ubuntu:latest

# Set working directory
WORKDIR /pufferpanel

# Update system and install dependencies
RUN apt-get update && apt-get install -y curl unzip sudo

# Install PufferPanel
RUN curl -fsSL https://download.pufferpanel.com/installer.sh | bash

# Start PufferPanel, wait, and create user
CMD /usr/bin/pufferpanel daemon & sleep 10 && \
    /usr/bin/pufferpanel user add --email ssh@admin.com --password 12345678 --name Admin --admin && \
    tail -f /dev/null
