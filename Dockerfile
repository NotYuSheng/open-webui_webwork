# Start from the original Open-WebUI image
FROM ghcr.io/notyusheng/open-webui_secure:v1.5.1

# Branding assets
RUN set -eux; \
    # ---- env.py ---------------------------------------------
    sed -i '110,112{s/^/# /}' /app/backend/open_webui/env.py && \
    sed -i '113i WEBUI_NAME = "Open WebUI WebWork"' /app/backend/open_webui/env.py && \
    \
    # ---- brand assets ---------------------------------------
    mkdir -p /app/build/favicon && \
    cp /logos/splash.png /app/backend/open_webui/static/splash.png && \
    cp /logos/favicon.svg /app/build/favicon.svg && \
    cp /logos/favicon-96x96.png /app/build/favicon/favicon-96x96.png && \
