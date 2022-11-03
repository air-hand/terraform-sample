MAKEFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
IS_IN_CONTAINER := $(shell sh -c 'test -f /.dockerenv && echo 0 || echo 1')

all: lint

.SILENT: pre-command

.PHONY: pre-command
pre-command:
	if [ $(IS_IN_CONTAINER) -ne 0 ]; then \
		echo "Please run this command in the container."; \
		exit 1; \
	fi;

.PHONY: lint
lint: tf-validate tflint tfsec

.PHONY: tf-validate
tf-validate: pre-command
	@terraform validate

.PHONY: tflint
tflint: pre-command
	@tflint --init; \
	tflint -f compact && echo "tflint succeeded."; \

.PHONY: tfsec
tfsec: pre-command
	@tfsec . && echo "tfsec succeeded."

.PHONY: apply
build: pre-command lint
	@terraform plan && terraform apply

.PHONY: destroy
destroy: pre-command lint
	@terraform destroy
