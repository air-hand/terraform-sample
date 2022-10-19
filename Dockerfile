FROM hashicorp/terraform:1.3.2

RUN apk add --no-cache curl unzip

RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/v0.41.0/install_linux.sh | sh
