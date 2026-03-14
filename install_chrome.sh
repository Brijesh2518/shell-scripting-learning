#!/bin/bash

echo "Updating system packages..."
sudo apt update -y

echo "Installing required dependencies..."
sudo apt install -y wget

echo "Downloading Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "Installing Google Chrome..."
sudo apt install -y ./google-chrome-stable_current_amd64.deb

echo "Cleaning up..."
rm google-chrome-stable_current_amd64.deb

echo "Google Chrome installation completed!"

echo "Launching Chrome..."
google-chrome &
