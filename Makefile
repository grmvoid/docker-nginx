REPO = ghcr.io/nulldark/nginx
NGINX_VERSION?=1.25
TARGET_PLATFORM?=linux/amd64

ifeq ($(TAG),)
	TAG ?= $(NGINX_VERSION)
endif

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