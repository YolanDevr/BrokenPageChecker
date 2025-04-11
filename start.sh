#!/bin/bash

echo "🔧 Updating apt and installing dependencies..."
apt-get update && apt-get install -y wget unzip curl gnupg2

echo "🌐 Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb

echo "📦 Downloading latest stable ChromeDriver..."
LATEST_DRIVER=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
wget "https://chromedriver.storage.googleapis.com/${LATEST_DRIVER}/chromedriver_linux64.zip"

echo "📂 Unzipping ChromeDriver..."
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv chromedriver /usr/local/bin/

echo "🚀 Starting Streamlit app..."
streamlit run app.py --server.port=10000 --server.address=0.0.0.0
