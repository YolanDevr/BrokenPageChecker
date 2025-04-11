#!/bin/bash

echo "🔧 Updating apt and installing dependencies..."
apt-get update && apt-get install -y wget unzip curl gnupg2

echo "🌐 Downloading and installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb

echo "🔎 Getting installed Chrome version..."
CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+\.\d+' | cut -d '.' -f 1)
echo "✅ Chrome major version detected: $CHROME_VERSION"

echo "🌐 Trying to get matching ChromeDriver version..."
DRIVER_VERSION=$(curl -s "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_$CHROME_VERSION")

if [ -z "$DRIVER_VERSION" ]; then
    echo "⚠️ Geen specifieke versie gevonden, gebruiken algemene laatste versie."
    DRIVER_VERSION=$(curl -s https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
fi

echo "📦 Downloading ChromeDriver version $DRIVER_VERSION..."
wget "https://chromedriver.storage.googleapis.com/$DRIVER_VERSION/chromedriver_linux64.zip"

echo "📂 Unzipping ChromeDriver..."
unzip chromedriver_linux64.zip
chmod +x chromedriver
mv chromedriver /usr/local/bin/

echo "🚀 Starting Streamlit app..."
streamlit run app.py --server.port=10000 --server.address=0.0.0.0
