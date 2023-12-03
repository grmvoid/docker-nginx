ARG ALPINE_VERSION=latest
FROM ghcr.io/nulldark/alpine:${ALPINE_VERSION}

LABEL org.opencontainers.image.title="nginx"
LABEL org.opencontainers.image.description="nginx docker container image"
LABEL org.opencontainers.image.url=https://github.com/nulldark/nginx
LABEL org.opencontainers.image.source=https://github.com/nulldark/nginx
LABEL org.opencontainers.image.authors="Dominik Szamburski <dominikszamburski99@gmai.com>"
LABEL org.opencontainers.image.vendor="nulldark"
LABEL org.opencontainers.image.licenses="MIT"

# setup..
RUN	apk update && \
	apk upgrade && \
	apk add --update openssl nginx && \
	rm -rf /var/cache/apk/*

# add users..
RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

ARG NGINX_SERVER_ROOT=/var/www
ENV NGINX_SERVER_ROOT ${NGINX_SERVER_ROOT}

# create /var/www dir
RUN mkdir -p ${NGINX_SERVER_ROOT} && \
	touch ${NGINX_SERVER_ROOT}/index.html && \
	chown -R www-data:www-data /var/lib/nginx && \
	chown -R www-data:www-data ${NGINX_SERVER_ROOT}

ARG NGINX_SSL=false
ENV NGINX_SSL ${NGINX_SSL}

RUN if [ ${NGINX_SSL} = true ]; then \
	# install certs..
 	mkdir /etc/nginx/certificates && \
		openssl req \
			-x509 \
			-newkey rsa:2048 \
			-keyout /etc/nginx/certificates/localhost.key \
			-out /etc/nginx/certificates/localhost.pem \
			-days 365 \
			-nodes \
			-subj /CN=localhost && \
		openssl dhparam -out /etc/nginx/dhparam.pem 4096 \
;fi

COPY etc/nginx.conf /etc/nginx/nginx.conf
COPY etc/conf.d/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]