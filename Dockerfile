# Use official PufferPanel base image
FROM pufferpanel/pufferpanel:latest

# Set working directory
WORKDIR /pufferpanel

# Expose the panel's default port (default: 8080)
EXPOSE 8080

# Start PufferPanel
CMD ["pufferpanel", "run"]
