# Start from the original Open-WebUI image
FROM ghcr.io/notyusheng/open-webui_secure:v1.5.1

# Replace the static files
COPY static/ /app/backend/open_webui/static/

# Make static content read-only and owned by root
RUN set -eux; \
    chown -R root:root /app/backend/open_webui/static && \
    find /app/backend/open_webui/static -type d -exec chmod 0555 {} \; && \
    find /app/backend/open_webui/static -type f -exec chmod 0444 {} \;
