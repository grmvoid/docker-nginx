## Quick reference
- **Image based on**:   
  [alpine](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
  `linux/amd64`, `linux/arm64`

- **Maintained by**:  
  [grmvoid](https://github.com/grmvoid)

- **Where to file issues**:    
  [https://github.com/grmvoid/docker-nginx/issues](https://github.com/grmvoid/docker-nginx/issues?q=)

## Supported tags and respective `Dockerfile` links

- [`1.27.3`, `1.27`](https://github.com/grmvoid/docker-nginx/blob/master/1.27/Dockerfile)
- [`1.26.2`, `1.26`](https://github.com/grmvoid/docker-nginx/blob/master/1.26/Dockerfile)
- [`1.25.5`, `1.25`](https://github.com/grmvoid/docker-nginx/blob/master/1.25/Dockerfile)

## How to use this image

### start a nginx instance

```bash
docker run --name some-nginx -d grmvoid/nginx:1.27.3
```

### ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `nginx`:

```yaml
version: '3.1'

services:
    nginx:
        image: grmvoid/nginx:1.27.3
        restart: always
        ports:
            - "80:80"
```
## LICENSE

View [license](https://nginx.org/LICENSE) information for the software contained in this image.
