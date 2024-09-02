#!/bin/bash

# Debugging Start
echo "Starting Puppeteer setup script..."
echo "Working directory: $(pwd)"
echo "Current user: $(whoami)"
echo "System information:"
uname -a
echo "Environment variables:"
env

# Install Node.js (if not installed)
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

# Install Puppeteer
echo "Installing Puppeteer..."
npm install puppeteer

# Verify installation
echo "Puppeteer installed. Verifying installation..."
node -e "console.log('Puppeteer version:', require('puppeteer').version());"

echo "Puppeteer setup script completed."
