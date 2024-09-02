# install_chrome.sh

# Create a temporary directory to work in
mkdir -p /tmp/chrome

# Download the Chrome .deb package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome/google-chrome-stable_current_amd64.deb

# Extract the .deb package using dpkg-deb
dpkg-deb -x /tmp/chrome/google-chrome-stable_current_amd64.deb /tmp/chrome/

# Locate the Chrome binary and set executable permissions
if [ -f /tmp/chrome/opt/google/chrome/chrome ]; then
  echo "Chrome binary found, setting up executable permissions."
  chmod +x /tmp/chrome/opt/google/chrome/chrome
else
  echo "Chrome binary not found in /tmp/chrome/opt/google/chrome/. Exiting."
  exit 1
fi

# List the contents of the /tmp/chrome/opt/google/chrome/ directory to verify the binary is there
ls -la /tmp/chrome/opt/google/chrome/