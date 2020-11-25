![Docker Image Version (latest semver)](https://img.shields.io/docker/v/cbtcr/webhook?style=flat)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/cbtcr/webhook/latest?style=flat)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/cbtcr/webhook?style=flat)
![Docker Pulls](https://img.shields.io/docker/pulls/cbtcr/webhook?style=flat)
![GitHub](https://img.shields.io/github/license/CalumBThomson/webhook?style=flat)

# webhook
Dockerised container image for Webhook running on an Alpine base with tini init.  

## Quick Start
Create a webhooks file on the host file system (see Webhook repo). Then launch a new container -- mount the webhooks file to `/etc/webhook/hooks.json` and map default port 9000:  
```
docker run --rm --name webhook -d -p 9000:9000 -v /path-to-hooks-file/example.json:/etc/webhook/hooks.json cbtcr/webhook
```

Alternatively, create a Dockerfile to build a new image based on this one, then copy in your webhooks file:  
```
FROM cbtcr/webhook
COPY ["example.json","/etc/webhook/hooks.json"]
```

## References
- Webhook -- https://github.com/adnanh/webhook
- Alpine -- https://hub.docker.com/_/alpine
- tini -- https://github.com/krallin/tini
