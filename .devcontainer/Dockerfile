FROM debian:bookworm-slim

COPY install.sh /app/install.sh

WORKDIR /app

# نصب وابستگی‌ها
RUN echo "📦 Installing dependencies..." && \
    apt-get update && apt-get install -y --no-install-recommends \
    bash curl wget unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/* && \
    echo "✅ Dependencies ready"

# اجرای نصب Xray
RUN chmod +x /app/install.sh && /app/install.sh

COPY config.json /etc/config.json

# ساخت startup script با ظاهر متفاوت
RUN echo '#!/bin/bash' > /app/startup.sh && \
    echo 'echo "════════════════════════════════════════════"' >> /app/startup.sh && \
    echo 'echo "     Proxy Service Started Successfully"' >> /app/startup.sh && \
    echo 'echo "════════════════════════════════════════════"' >> /app/startup.sh && \
    echo 'echo ""' >> /app/startup.sh && \
    echo 'echo "🌐 Service Information:"' >> /app/startup.sh && \
    echo 'echo "   • Port: 443"' >> /app/startup.sh && \
    echo 'echo "   • Protocol: VLESS + XHTTP"' >> /app/startup.sh && \
    echo 'echo "   • SNI: ${CODESPACE_NAME}-443.app.github.dev"' >> /app/startup.sh && \
    echo 'echo ""' >> /app/startup.sh && \
    echo 'echo "🔑 Your VLESS Link:"' >> /app/startup.sh && \
    echo 'echo "vless://6b3c8ecf-c41f-41fc-8745-e6c88a8ea62c@${CODESPACE_NAME}-443.app.github.dev:443?type=xhttp&security=none&path=%2F&mode=packet-up#My-Proxy"' >> /app/startup.sh && \
    echo 'echo ""' >> /app/startup.sh && \
    echo 'echo "Service is running... Press Ctrl+C to stop."' >> /app/startup.sh && \
    echo 'exec /usr/local/bin/xray -c /etc/config.json' >> /app/startup.sh && \
    chmod +x /app/startup.sh

CMD ["/app/startup.sh"]
