FROM debian:bookworm-slim

WORKDIR /app

# نصب وابستگی‌ها + nginx
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget unzip ca-certificates nginx \
    && rm -rf /var/lib/apt/lists/*

# نصب Xray
RUN wget -q -O xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.3.27/Xray-linux-64.zip \
    && unzip -q xray.zip && chmod +x xray && mv xray /usr/local/bin/xray \
    && rm xray.zip

# صفحه Speedtest فیک (ساده و سبک)
RUN mkdir -p /var/www/html && \
    echo '<!DOCTYPE html><html><head><meta charset="utf-8"><title>Speed Test</title><style>body{font-family:Arial;background:#0f0f0f;color:#0f0;text-align:center;padding:50px;}</style></head><body><h1>🌐 Connection Speed Test</h1><p><strong>Server:</strong> GitHub Codespaces</p><p><strong>Status:</strong> <span style="color:lime;">Online</span></p><button onclick="alert(\"Download Speed: \~500 Mbps\nUpload Speed: \~300 Mbps\nPing: 25ms\")">Run Test</button><p style="margin-top:50px;font-size:0.8em;color:#666;">This is a fake test page for demonstration.</p></body></html>' > /var/www/html/index.html

COPY config.json /etc/config.json
COPY startup.sh /app/startup.sh

RUN chmod +x /app/startup.sh /app/setup.sh

EXPOSE 443

CMD ["/app/startup.sh"]
