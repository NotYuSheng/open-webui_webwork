# Start from the original Open-WebUI image
FROM ghcr.io/notyusheng/open-webui_secure:v1.5.1

# Replace the static files
COPY static/ /app/backend/open_webui/static/
