ARG NGINX_VERSION=alpine
FROM nginx:${NGINX_VERSION}

LABEL org.opencontainers.image.url="https://github.com/bytebits9/nginx"
LABEL org.opencontainers.image.source="https://github.com/bytebits9/nginx"
LABEL org.opencontainers.image.title="nginx"
LABEL org.opencontainers.image.base.name="docker.io/library/nginx:alpine"
LABEL org.opencontainers.image.licenses=MIT

COPY conf/nginx.conf /etc/nginx/
COPY sites-available/default.conf /etc/nginx/sites-available/default.conf

RUN apk update \
    && apk upgrade \
    && apk add openssl

RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

EXPOSE 80 443