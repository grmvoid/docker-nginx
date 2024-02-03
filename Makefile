SHELL=/bin/bash

export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1
export BUILDKIT_PROGRESS=plain

NGINX_VERSION ?= 1.25

TAG ?= latest
PLATFORM ?= linux/amd64

DOCKER_IMAGE_NAME:=nuldark/nginx
DOCKER_IMAGE:=$(DOCKER_IMAGE_NAME):$(TAG)

build:
	docker build --tag $(REPO):$(TAG) \
		$(NGINX_VERSION)/

buildx-build-amd64:
	docker buildx build --load \
		--platform linux/amd64 \
		--tag $(REPO):$(NGINX_VERSION) \
		--file $(NGINX_VERSION)/Dockerfile $(NGINX_VERSION)/

buildx-build:
	docker buildx build --platform $(TARGET_PLATFORM) \
		--tag $(REPO):$(NGINX_VERSION) \
		--file $(NGINX_VERSION)/Dockerfile $(NGINX_VERSION)/

buildx-push:
	docker buildx build --platform=$(TARGET_PLATFORM) --push \
		--tag $(REPO):$(TAG) \
		--file $(NGINX_VERSION)/Dockerfile $(NGINX_VERSION)/