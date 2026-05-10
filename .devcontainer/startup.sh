#!/bin/bash

echo "════════════════════════════════════════════"
echo "     Xray + Fake Speedtest Started"
echo "════════════════════════════════════════════"

nginx -g 'daemon on;'

exec /usr/local/bin/xray -c /etc/config.json
