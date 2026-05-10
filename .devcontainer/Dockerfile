FROM debian:bookworm-slim

COPY install.sh /app/install.sh

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash git curl wget unzip tzdata openssl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN chmod +x /app/install.sh && /app/install.sh

COPY config.json /etc/config.json

RUN echo '#!/bin/bash' > /app/startup.sh && \
    echo 'echo "════════════════════════════════════════════"' >> /app/startup.sh && \
    echo 'echo "     G2RAY - VLESS Proxy Started"' >> /app/startup.sh && \
    echo 'echo "════════════════════════════════════════════"' >> /app/startup.sh && \
    echo 'echo ""' >> /app/startup.sh && \
    echo "echo '🔗 Your UUID: 6b3c8ecf-c41f-41fc-8745-e6c88a8ea62c'" >> /app/startup.sh && \
    echo 'echo ""' >> /app/startup.sh && \
    echo "echo '🌐 Link:'" >> /app/startup.sh && \
    echo 'echo "vless://6b3c8ecf-c41f-41fc-8745-e6c88a8ea62c@${CODESPACE_NAME}-443.app.github.dev:443?type=xhttp&security=none&path=%2F&mode=packet-up#GH"' >> /app/startup.sh && \
    echo 'echo ""' >> /app/startup.sh && \
    echo 'exec /usr/local/bin/xray -c /etc/config.json' >> /app/startup.sh && \
    chmod +x /app/startup.sh

CMD ["/app/startup.sh"]
