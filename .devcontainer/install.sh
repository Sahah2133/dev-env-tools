#!/bin/sh

echo "🔽 Downloading Xray core..."
wget -q -O xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.3.27/Xray-linux-64.zip

echo "📦 Installing Xray..."
unzip -q xray.zip
chmod +x xray
mv xray /usr/local/bin/xray

rm -rf xray.zip *.dat
echo "✅ Xray installed successfully"
