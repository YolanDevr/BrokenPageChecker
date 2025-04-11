#!/bin/bash

# Installeer Google Chrome (werkt beter dan Chromium op Streamlit Cloud)
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get update
apt-get install -y ./google-chrome-stable_current_amd64.deb
