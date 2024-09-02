# install_chrome.sh

# Download the Chrome .deb package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Extract the package to the /app directory on Render
dpkg -x google-chrome-stable_current_amd64.deb /app

# Move the Chrome binary to a location where your app can easily use it
mv /app/opt/google/chrome/chrome /app/chrome

# Make the Chrome binary executable
chmod +x /app/chrome
