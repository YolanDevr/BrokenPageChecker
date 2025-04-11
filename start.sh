#!/bin/bash

# Installeer Google Chrome
apt-get update
apt-get install -y wget gnupg2 unzip curl
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install -y ./google-chrome-stable_current_amd64.deb

# Start de Streamlit app
streamlit run app.py --server.port=10000 --server.address=0.0.0.0
