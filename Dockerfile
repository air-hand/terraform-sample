FROM hashicorp/terraform:1.3.2

RUN apk update && \
    apk add --no-cache curl unzip \
    # for install tfsec
    coreutils bash \
    # other tools
    make

ENV \
    TFLINT_VERSION=v0.41.0 \
    TFSEC_VERSION=v1.28.0

RUN \
    curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash \
    && curl -s https://raw.githubusercontent.com/aquasecurity/tfsec/master/scripts/install_linux.sh | bash \
    ;
