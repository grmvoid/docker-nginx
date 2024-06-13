# Nginx Docker Container Images

## Supported tags and respective Dockerfile links
- [`1.27`, `1.27.0`, `latest`](https://github.com/nuldark/docker-nginx/blob/master/1.27/Dockerfile)
- [`1.26`, `1.26.0`](https://github.com/nuldark/docker-nginx/blob/master/1.26/Dockerfile)
- [`1.25`, `1.25.5`](https://github.com/nuldark/docker-nginx/blob/master/1.25/Dockerfile)
- [`1.24`](https://github.com/nuldark/docker-nginx/blob/master/1.24/Dockerfile)

## Quick reference
- **Image based on**:   
    [alpine](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
    `linux/amd64`, `linux/arm64`

- **Maintained by**:  
     [nuldark](https://github.com/nuldark)

- **Where to file issues**:    
     [https://github.com/nuldark/docker-nginx/issues](https://github.com/nuldark/docker-nginx/issues?q=)

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
