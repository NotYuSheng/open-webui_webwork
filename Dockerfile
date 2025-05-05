# 1. Base image
FROM ghcr.io/notyusheng/open-webui_secure:v1.5.1

# 2. Patch env.py: comment out lines 110–112, insert your WEBUI_NAME
RUN set -eux; \
    sed -i '110,112{s/^/# /}' /app/backend/open_webui/env.py; \
    sed -i '113i WEBUI_NAME = "WebWork Open WebUI"' /app/backend/open_webui/env.py

# 3. Copy your branding assets into the image
COPY logos/splash.png        /app/backend/open_webui/static/splash.png
COPY logos/favicon.png       /app/backend/open_webui/static/favicon.png
COPY logos/favicon.svg       /app/build/favicon.svg
COPY logos/favicon-96x96.png /app/build/favicon/favicon-96x96.png

# 4. Lock down static files (root:root, 0444) and directories (0555)
RUN set -eux; \
    chown root:root \
      /app/backend/open_webui/static/splash.png \
      /app/backend/open_webui/static/favicon.png \
      /app/build/favicon.svg \
      /app/build/favicon/favicon-96x96.png && \
    chmod 0444 \
      /app/backend/open_webui/static/splash.png \
      /app/backend/open_webui/static/favicon.png \
      /app/build/favicon.svg \
      /app/build/favicon/favicon-96x96.png && \
    chmod 0555 \
      /app/backend/open_webui/static \
      /app/build/favicon

# 5. Prepare the actual writable data directory for Peewee/SQLite
RUN set -eux; \
    mkdir -p /app/backend/data && \
    chown -R 10001:0 /app/backend/data && \
    chmod 0755 /app/backend/data

# 6. Drop to the non‑root user
USER 10001
