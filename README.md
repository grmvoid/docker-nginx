# Nginx Docker Container Images

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/nuldark/nginx/ci.yml)
![GitHub release (with filter)](https://img.shields.io/github/v/release/nuldark/nginx)

## Supported tags and respective Dockerfile links
- [`1.25`, `latest`](https://github.com/nuldark/nginx/blob/master/1.25/Dockerfile)
- [`1.24`](https://github.com/nuldark/nginx/blob/master/1.24/Dockerfile)

## Quick reference
- **Image based on**:   
    [alpine](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
    `linux/amd64`, `linux/arm64`

- **Maintained by**:  
     [nuldark](https://github.com/nuldark)

- **Where to file issues**:    
     [https://github.com/nuldark/nginx/issues](https://github.com/nuldark/nginx/issues?q=)

## How to use this image

### start a nginx instance

```console
$ docker run --name some-nginx -d nginx
```

### ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `nginx`:

```yaml
version: '3.1'

services:
    nginx:
        image: nuldark/nginx:latest
        restart: always
        ports:
            - "80:80"
```