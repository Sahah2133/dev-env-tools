#!/bin/bash

echo "🔧 Running setup tasks..."

# منتظر بمان تا Codespace آماده بشه
sleep 8

# تنظیم visibility پورت به Public
echo "🌐 Setting port 443 to Public..."
gh codespace ports visibility 443:public -c $CODESPACE_NAME || echo "Warning: Could not set public visibility automatically"

echo "✅ Setup completed!"
