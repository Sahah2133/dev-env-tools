#!/bin/bash

echo "🔧 Setting up port visibility..."

sleep 10

for i in {1..8}; do
  echo "Attempt $i: Making port 443 Public..."
  if gh codespace ports visibility 443:public -c $CODESPACE_NAME > /dev/null 2>&1; then
    echo "✅ Port 443 successfully set to Public!"
    break
  else
    echo "⚠️ Attempt $i failed. Retrying in 4 seconds..."
    sleep 4
  fi
done

echo ""
echo "🌐 Speedtest Page: https://${CODESPACE_NAME}-443.app.github.dev"
echo "🔑 VLESS: vless://6b3c8ecf-c41f-41fc-8745-e6c88a8ea62c@${CODESPACE_NAME}-443.app.github.dev:443?type=xhttp&security=none&path=%2F&mode=packet-up#MyGT"
