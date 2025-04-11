#!/bin/bash

# ----------------------------
# INSTALLATIE VAN GOOGLE CHROME
# ----------------------------
echo "🔧 Installing Google Chrome..."
sudo apt-get update
sudo apt-get install -y wget gnupg unzip curl software-properties-common

# Voeg Google’s repo toe en installeer Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb

# ----------------------------
# SETUP VOOR CHROMEDRIVER
# ----------------------------
echo "🔧 Setting up ChromeDriver..."
CHROME_VERSION=$(google-chrome --version | grep -oP "\d+\.\d+\.\d+\.\d+" | cut -d '.' -f 1)
DRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION")
wget "https://chromedriver.storage.googleapis.com/$DRIVER_VERSION/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip
chmod +x chromedriver
sudo mv chromedriver /usr/local/bin/

# ----------------------------
# START DE STREAMLIT APP
# ----------------------------
echo "🚀 Starting Streamlit..."
streamlit run app.py --server.port=10000 --server.address=0.0.0.0
