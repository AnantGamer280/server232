# Base image (Ubuntu)
FROM ubuntu:latest

# Set working directory
WORKDIR /pufferpanel

# Update and install dependencies
RUN apt-get update && apt-get install -y curl unzip

# Install PufferPanel
RUN curl -fsSL https://download.pufferpanel.com/installer.sh | sh

# Expose the default panel port
EXPOSE 8080

# Start PufferPanel and create a default user
CMD ["sh", "-c", "pufferpanel run & sleep 5 && pufferpanel user add --email ssh@admin.com --password 12345678 --name Admin --admin && tail -f /dev/null"]
