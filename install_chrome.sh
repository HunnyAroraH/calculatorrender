# install_chrome.sh
mkdir -p /tmp/chrome
wget -O /tmp/chrome/chrome.tar.gz https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.tar.gz
tar -xvzf /tmp/chrome/chrome.tar.gz -C /tmp/chrome/
mv /tmp/chrome/opt/google/chrome/chrome /tmp/chrome/
chmod +x /tmp/chrome/chrome
