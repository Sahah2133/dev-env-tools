#!/bin/bash

echo "════════════════════════════════════════════"
echo "     Proxy + Fake Web Service Started"
echo "════════════════════════════════════════════"
echo ""
echo "🌐 Web Page (Speed Test):"
echo "   https://${CODESPACE_NAME}-443.app.github.dev"
echo ""
echo "🔑 VLESS Link:"
echo "vless://6b3c8ecf-c41f-41fc-8745-e6c88a8ea62c@${CODESPACE_NAME}-443.app.github.dev:443?type=xhttp&security=none&path=%2F&mode=packet-up#MyGT"
echo ""

# اجرای nginx برای صفحه وب
nginx -g 'daemon on;'

# اجرای Xray
exec /usr/local/bin/xray -c /etc/config.json
