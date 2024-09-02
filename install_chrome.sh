#!/bin/bash

# Debugging Start
echo "Starting Chrome installation script..."
echo "Working directory: $(pwd)"
echo "Current user: $(whoami)"
echo "System information:"
uname -a
echo "Environment variables:"
env

# Create a temporary directory to work in
echo "Creating /tmp/chrome directory..."
mkdir -p /tmp/chrome
echo "Directory created. Current contents of /tmp:"
ls -la /tmp

# Download the Chrome .deb package
echo "Downloading Chrome .deb package..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome/google-chrome-stable_current_amd64.deb
if [ $? -ne 0 ]; then
  echo "Failed to download Chrome .deb package. Exiting."
  exit 1
fi
echo "Download completed. Current contents of /tmp/chrome:"
ls -la /tmp/chrome

# Extract the .deb package using dpkg-deb
echo "Extracting the Chrome .deb package..."
dpkg-deb -x /tmp/chrome/google-chrome-stable_current_amd64.deb /tmp/chrome/
if [ $? -ne 0 ]; then
  echo "Failed to extract Chrome .deb package. Exiting."
  exit 1
fi
echo "Extraction completed. Current contents of /tmp/chrome:"
ls -la /tmp/chrome

# Locate the Chrome binary and set executable permissions
chrome_binary_path="/tmp/chrome/opt/google/chrome/chrome"
echo "Checking for Chrome binary at ${chrome_binary_path}..."
if [ -f ${chrome_binary_path} ]; then
  echo "Chrome binary found. Setting up executable permissions."
  chmod +x ${chrome_binary_path}
  if [ $? -ne 0 ]; then
    echo "Failed to set executable permissions on Chrome binary. Exiting."
    exit 1
  fi
  echo "Permissions set. Verifying..."
  ls -la ${chrome_binary_path}
else
  echo "Chrome binary not found at ${chrome_binary_path}. Exiting."
  exit 1
fi

# List the contents of the /tmp/chrome/opt/google/chrome/ directory to verify the binary is there
echo "Final contents of /tmp/chrome/opt/google/chrome/:"
ls -la /tmp/chrome/opt/google/chrome/

# Debugging End
echo "Chrome installation script completed."
