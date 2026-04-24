#!/bin/bash
# Author : Brijesh Sharma
# Date : 24 Apr 2026


# Exit on error
set -e

echo "🚀 Starting Brave Browser installation..."

# Update system
sudo apt update

# Install curl if not installed
sudo apt install -y curl

# Add Brave GPG key
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg \
https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

# Add Brave repository
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] \
https://brave-browser-apt-release.s3.brave.com/ stable main" | \
sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

# Update package list again
sudo apt update

# Install Brave
sudo apt install -y brave-browser

echo "✅ Brave Browser installed successfully!"

# Optional: Launch Brave
read -p "Do you want to launch Brave now? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    brave-browser &
fi
