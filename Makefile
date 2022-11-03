MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MOUNT_OPTION := type=bind,source="$(MAKEFILE_DIR)/src",target=/app
MOUNT_DOCKER_SOCK := type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock
DOCKER_IMAGE := localhost:terraform
IS_IN_CONTAINER := $(shell sh -c 'test -f /.dockerenv && echo 0 || echo 1')

.PHONY: all
all: build bash

.PHONY: build
build:
	docker build --tag $(DOCKER_IMAGE) \.

.PHONY: bash
bash:
	docker run -it --rm --entrypoint /bin/sh --workdir /app --mount $(MOUNT_OPTION) --mount $(MOUNT_DOCKER_SOCK) $(DOCKER_IMAGE)

