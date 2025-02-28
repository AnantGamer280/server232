# Base image
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install necessary dependencies (example: IIS for web hosting)
RUN powershell -Command "Install-WindowsFeature -name Web-Server -IncludeManagementTools"

# Expose a port
EXPOSE 8080

# Start a simple web server
CMD ["powershell", "Start-Process", "-NoNewWindow", "-FilePath", "C:\\Windows\\System32\\inetsrv\\inetinfo.exe"]
