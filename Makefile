TERRAFORM_VERSION := 1.3.2
MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MOUNT_OPTION := type=bind,source="$(MAKEFILE_DIR)/src",target=/app
DOCKER_SOCK_MOUNT := type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock

#.PHONY: all 
#all: bash

.PHONY: bash
bash:
	docker run -it --rm --entrypoint /bin/sh --workdir /app --mount $(MOUNT_OPTION) --mount $(DOCKER_SOCK_MOUNT) hashicorp/terraform:$(TERRAFORM_VERSION)
