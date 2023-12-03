# Nginx Docker Container Images

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/nulldark/nginx/ci.yml)
![GitHub release (with filter)](https://img.shields.io/github/v/release/nulldark/nginx)

# Supported tags and respective Dockerfile links
- [`1.24`, `latest`](https://github.com/nulldark/nginx/blob/master/Dockerfile)

# Quick reference
-	**Supported architectures**:
    `linux/amd64`, `linux/arm64`
-	**Maintained by**:
    [nulldark](https://github.com/nulldark)

-	**Where to file issues**:
    [https://github.com/nulldark/nginx/issues](https://github.com/nulldark/nginx/issues?q=)

## How to use this image

## start a nginx instance

```console
$ docker run --name some-nginx -e NGINX_SERVER_ROOT=/var/www -d nginx
```

## ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `nginx`:

```yaml
version: '3.1'

services:
    nginx:
        image: ghrc.io/nulldark/nginx
        restart: always
        environment:
            NGINX_SSL: OFF
            NGINX_SERVER_ROOT: /var/www
        ports:
            - "80:80"
```

## Environment Variables

The Nginx image uses several environment variables which are easy to miss.

| Variable            | Default Value | Description |
|---------------------|---------------|-------------|
| `NGINX_SERVER_ROOT` | `/var/www`    |             |
| `NGINX_SSL`         | `false`       |             |

