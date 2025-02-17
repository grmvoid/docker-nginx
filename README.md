# Nginx Docker Container Image

A lightweight Nginx container image based on Alpine Linux, building with the Clang and LLVM.

## Quick reference
- **Image based on**: [alpine](https://hub.docker.com/_/alpine)
- **Supported architectures**: `linux/amd64`, `linux/arm64`
- **Maintained by**: [grmvoid](https://github.com/grmvoid)
- **Issues**: [https://github.com/grmvoid/docker-nginx/issues](https://github.com/grmvoid/docker-nginx/issues?q=)

## Usage

### Pull the Image
To get started, pull the specify a version Nginx image:
```bash
  docker pull grmvoid/nginx:1.27.4
```

### Running a Container
You can run the Nginx container interactively using the following command:
```bash
  docker run --name nginx -d grmvoid/nginx:1.27.4
```

### Running via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `nginx`:
```yaml
services:
    nginx:
        image: grmvoid/nginx:1.27.4
        restart: always
        ports:
            - "80:80"
```

## LICENSE
This repository follows the [Nginx License](https://nginx.org/LICENSE). Individual dependencies may have their own licensing terms.

Additionally, the contents of this repository are licensed under the [MIT License](LICENSE).