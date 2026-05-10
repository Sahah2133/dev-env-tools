FROM debian:bookworm-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl wget unzip ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O xray.zip https://github.com/XTLS/Xray-core/releases/download/v26.3.27/Xray-linux-64.zip \
    && unzip -q xray.zip && chmod +x xray && mv xray /usr/local/bin/ && rm xray.zip

COPY config.json /etc/config.json

CMD ["/usr/local/bin/xray", "-c", "/etc/config.json"]
