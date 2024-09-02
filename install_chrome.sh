# install_chrome.sh

# Create a temporary directory to work in
mkdir -p /tmp/chrome

# Download the Chrome .deb package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/chrome/google-chrome-stable_current_amd64.deb

# Extract the .deb package using dpkg-deb
dpkg-deb -x /tmp/chrome/google-chrome-stable_current_amd64.deb /tmp/chrome/

# Move the Chrome binary to /tmp/chrome/
mv /tmp/chrome/opt/google/chrome/chrome /tmp/chrome/chrome

# Make the Chrome binary executable
chmod +x /tmp/chrome/chrome
