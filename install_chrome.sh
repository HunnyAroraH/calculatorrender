# install_chrome.sh

# Create a temporary directory to work in
mkdir -p /tmp/chrome

# Download the Chrome .deb package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome/google-chrome-stable_current_amd64.deb

# Extract the .deb package using dpkg-deb
dpkg-deb -x /tmp/chrome/google-chrome-stable_current_amd64.deb /tmp/chrome/

# Check if the Chrome binary exists before moving it
if [ -f /tmp/chrome/opt/google/chrome/chrome ]; then
  echo "Chrome binary found, moving it to /tmp/chrome/"
  mv /tmp/chrome/opt/google/chrome/chrome /tmp/chrome/chrome
  chmod +x /tmp/chrome/chrome
else
  echo "Chrome binary not found, exiting."
  exit 1
fi

# List the contents of the /tmp/chrome/ directory to verify the binary is there
ls -la /tmp/chrome/

# Move the Chrome binary to /tmp/chrome/
mv /tmp/chrome/opt/google/chrome/chrome /tmp/chrome/chrome

# Make the Chrome binary executable
chmod +x /tmp/chrome/chrome
