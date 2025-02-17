#!/bin/bash

# Check if the script is being run with sudo privileges
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run with sudo privileges."
    exit 1
fi

# Update package index
echo "Updating package index..."
sudo apt update

# Install Redis
echo "Installing Redis..."
sudo apt install -y redis-server

# Start Redis service
echo "Starting Redis service..."
sudo systemctl start redis-server

# Enable Redis service to start at boot
echo "Enabling Redis service to start at boot..."
sudo systemctl enable redis-server

# Verify Redis installation
echo "Verifying Redis installation..."
redis-cli ping
