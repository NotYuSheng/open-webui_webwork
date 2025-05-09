# open-webui_webwork

This version of open-webui builds the `open-webui_webwork` image with the custom configuration for our use case.

1. Clone the Repository

   ```bash
   git clone https://github.com/NotYuSheng/open-webui_webwork
   cd open-webui_webwork
   ```

2. Make modifications

3. Build

   Start the service using docker-compose:
   ```bash
   docker compose up -d --build
   ```

5. Commit

   Commit your container’s state with a new tag (replace `vX.X.X` with your version number):
   ```bash
   docker commit open-webui_webwork open-webui_webwork:vX.X.X
   ```

6. Tag image

   Once your changes are made, tag it with your GitHub Container Registry namespace:
   ```bash
   docker tag open-webui_webwork:vX.X.X ghcr.io/notyusheng/open-webui_webwork:vX.X.X
   docker tag open-webui_webwork:vX.X.X ghcr.io/notyusheng/open-webui_webwork:latest
   ```

7. Push the Image to GHCR

   Log in to GHCR using your GitHub username and a Personal Access Token (PAT) with the write:packages scope:
   ```bash
   docker login ghcr.io -u <your-github-username>
   ```
   Then push both tagged images:
   ```bash
   docker push ghcr.io/notyusheng/open-webui_webwork:vX.X.X
   docker push ghcr.io/notyusheng/open-webui_webwork:latest
   ```
