#!/bin/bash

echo "════════════════════════════════════════════"
echo "     Proxy + Fake Speedtest Started"
echo "════════════════════════════════════════════"
echo ""
echo "🌐 Fake Speedtest Page:"
echo "   https://${CODESPACE_NAME}-443.app.github.dev"
echo ""
echo "🔑 VLESS Link:"
echo "vless://6b3c8ecf-c41f-41fc-8745-e6c88a8ea62c@${CODESPACE_NAME}-443.app.github.dev:443?type=xhttp&security=none&path=%2F&mode=packet-up#MyGT"
echo ""

# شروع nginx برای نمایش صفحه وب
nginx -g 'daemon on;'

# شروع Xray
exec /usr/local/bin/xray -c /etc/config.json
