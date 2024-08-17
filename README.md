# nginx

## Quick reference
- **Image based on**:   
  [alpine](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
  `linux/amd64`, `linux/arm64`

- **Maintained by**:  
  [sxbrsky](https://github.com/sxbrsky)

- **Where to file issues**:    
  [https://github.com/sxbrsky/docker-nginx/issues](https://github.com/sxbrsky/docker-nginx/issues?q=)

## Supported tags and respective Dockerfile links

[`All supported tags see here`](https://hub.docker.com/r/sxbrsky/nginx/tags)

## How to use this image

### start a nginx instance

```console
$ docker run --name some-nginx -d sxbrsky/nginx:latest
```

### ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `nginx`:

```yaml
version: '3.1'

services:
    nginx:
        image: sxbrsky/nginx:latest
        restart: always
        ports:
            - "80:80"
```
## LICENSE

View [license](https://nginx.org/LICENSE) information for the software contained in this image.
