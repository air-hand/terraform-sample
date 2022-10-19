MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MOUNT_OPTION := type=bind,source="$(MAKEFILE_DIR)/src",target=/app
DOCKER_SOCK_MOUNT := type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock
DOCKER_IMAGE := localhost:terraform

.PHONY: all
all: build bash

.PHONY: build
build:
	docker build --tag $(DOCKER_IMAGE) \.

.PHONY: bash
bash:
	docker run -it --rm --entrypoint /bin/sh --workdir /app --mount $(MOUNT_OPTION) --mount $(DOCKER_SOCK_MOUNT) $(DOCKER_IMAGE)
