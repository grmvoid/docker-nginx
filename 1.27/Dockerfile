FROM alpine:3.21

ARG NGINX_VERSION=1.27.3

LABEL org.opencontainers.image.base.name="docker.io/library/alpine:3.21" \
      org.opencontainers.image.description="Application packaged by sxbrsky" \
      org.opencontainers.image.documentation="https://github.com/sxbrsky/docker-nginx/tree/master/README.md" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.ref.name="${NGINX_VERSION}" \
      org.opencontainers.image.source="https://github.com/sxbrsky/docker-nginx/tree/master/1.27" \
      org.opencontainers.image.title="nginx" \
      org.opencontainers.image.vendor="sxbrsky" \
      org.opencontainers.image.version="${NGINX_VERSION}"

RUN set -eux; \
  # install deps and dev-deps
    apk add --no-cache \
        gzip \
        pcre \
        zlib; \
    apk add --no-cache --virtual .build-deps \
        wget \
        gnupg \
        clang \
        llvm \
        zlib-dev \
        pcre-dev \
        make \
        openssl-dev; \
  # create nginx user
    addgroup -g 101 -S nginx && \
    adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologon -G nginx -g nginx nginx; \
  # gets and unpack nginx
    mkdir -p /usr/src/nginx; \
    cd /usr/src/nginx; \
    wget https://nginx.org/download/nginx-$NGINX_VERSION.tar.gz; \
    tar -xvf nginx-${NGINX_VERSION}.tar.gz; \
    cd nginx-${NGINX_VERSION}; \
  # configure nginx build
    ./configure \
        --prefix=/etc/nginx \
        --sbin-path=/usr/sbin/nginx \
        --modules-path=/etc/nginx/modules \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/dev/stdout \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/lock/nginx.lock \
        --user=nginx \
        --group=nginx \
        --with-threads \
        --with-http_ssl_module \
        --with-http_v2_module \
        --with-http_v3_module \
        --with-http_realip_module \
        --with-http_addition_module \
        --with-http_dav_module \
        --with-http_flv_module \
        --with-http_mp4_module \
        --with-http_gunzip_module \
        --with-http_gzip_static_module \
        --with-http_auth_request_module \
        --with-http_random_index_module \
        --with-http_secure_link_module \
        --with-http_slice_module \
        --with-http_stub_status_module \
        --with-http_sub_module \
        --http-log-path=/dev/stdout \
        --with-compat \
        --with-cc=clang \
        --with-cc-opt='-Wno-error -fstack-protector-strong -fPIC -fpie -O3 -funroll-loops -ffast-math -finline-functions' \
        --with-ld-opt="-Wl"; \
    make; make install; \
  # smoke test
    nginx -v; \
  # clean up
    apk del --no-cache .build-deps; \
    rm -rf /usr/src/nginx; \
    rm -rf /var/cache/apk; \
  # finalize setup
    mkdir -p \
        /usr/share/nginx \
        /var/log/nginx \
        /var/cache/nginx  \
        /usr/lib/nginx/modules; \
    \
      ln -s usr/lib/nginx/modules /etc/nginx/modules; \
      ln -sf /dev/stdout /var/log/nginx/access.log; \
      ln -sf /dev/stderr /var/log/nginx/error.log; \
      touch /var/run/nginx.pid; \
    \
    chown -R nginx:nginx \
        /usr/share/nginx /etc/nginx \
        /var/run/nginx.pid  \
        /var/cache/nginx  \
        /var/log/nginx  \
        /usr/lib/nginx; \
    chmod -R 744  \
        /etc/nginx  \
        /var/run/nginx.pid  \
        /var/cache/nginx  \
        /var/log/nginx  \
        /usr/lib/nginx \
        /usr/share/nginx

# final step
USER nginx
WORKDIR /etc/nginx

STOPSIGNAL SIGQUIT