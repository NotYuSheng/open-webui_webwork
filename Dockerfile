# 1. Base image
FROM ghcr.io/notyusheng/open-webui_secure:v1.5.1

# 2. Overwrite env.py and config.py with your local copies
COPY overrides/env.py    /app/backend/open_webui/env.py
COPY overrides/config.py /app/backend/open_webui/config.py

# 3. Copy & lock your static assets exactly as before
COPY logos/splash.png        /app/backend/open_webui/static/splash.png
COPY logos/favicon.png       /app/backend/open_webui/static/favicon.png
COPY logos/favicon.svg       /app/build/favicon.svg
COPY logos/favicon-96x96.png /app/build/favicon/favicon-96x96.png

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
      /app/build/favicon && \
    mkdir -p /app/backend/data && \
    chmod 0777 /app/backend/data
