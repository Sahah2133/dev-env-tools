FROM debian:bookworm-slim

WORKDIR /app

# نصب nginx + ابزارها
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget unzip ca-certificates nginx \
    && rm -rf /var/lib/apt/lists/*

# نصب Xray
RUN wget -q -O xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.3.27/Xray-linux-64.zip \
    && unzip -q xray.zip && chmod +x xray && mv xray /usr/local/bin/xray && rm xray.zip

# صفحه Speedtest فیک
RUN mkdir -p /var/www/html && \
    echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Speed Test</title><style>body{font-family:Arial,sans-serif;background:#111;color:#0f0;text-align:center;padding:60px;}</style></head><body><h1>🌐 Connection Speed Test</h1><p><strong>Server:</strong> GitHub Codespaces</p><p><strong>Status:</strong> <span style="color:lime;">Online & Running</span></p><button style="padding:15px 30px;font-size:16px;" onclick="alert(\"Download: \~450 Mbps\nUpload: \~280 Mbps\nPing: 18-35ms\n\nThis is a fake test page.\")">Run Speed Test</button><p style="margin-top:60px;font-size:0.85em;color:#555;">Proxy service is active on this port.</p></body></html>' > /var/www/html/index.html

COPY config.json /etc/config.json
COPY startup.sh /app/startup.sh

RUN chmod +x /app/startup.sh

EXPOSE 443

CMD ["/app/startup.sh"]
