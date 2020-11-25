![Docker Image Version (latest semver)](https://img.shields.io/docker/v/cbtcr/webhook-alpine?style=flat)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/cbtcr/webhook-alpine/latest?style=flat)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/cbtcr/webhook-alpine?style=flat)
![Docker Pulls](https://img.shields.io/docker/pulls/cbtcr/webhook-alpine?style=flat)
![GitHub](https://img.shields.io/github/license/CalumBThomson/webhook-alpine?style=flat)

# webhook-alpine
Docker container image for [Webhook](https://github.com/adnanh/webhook) running on Alpine base.

## Quick Start
Create local webhooks file (see https://github.com/adnanh/webhook). Then launch container, mounting the webhooks file to `/etc/webhook/hooks.json` and mapping default port 9000:
```
docker run --rm --name webhook -d -p 9000:9000 -v /path-to-hooks-file/example.json:/etc/webhook/hooks.json cbtcr/webhook-alpine
```

Alternatively, create following Dockerfile to build new image and copy in your webhooks file:
```
FROM cbtcr/webhook-alpine
COPY ["example.json","/etc/webhook/hooks.json"]
```
