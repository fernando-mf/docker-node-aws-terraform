FROM node:13-alpine

ARG TERRAFORM_VERSION=0.11.14

RUN apk add --no-cache \
    docker-cli \
    python \
    py-pip \
    py-setuptools \
    ca-certificates \
    openssl \
    groff \
    less \
    bash \
    curl \
    jq \
    git \
    zip && \
    pip install --no-cache-dir --upgrade pip awscli && \
    aws configure set preview.cloudfront true

RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip -d /usr/local/bin && \
    rm -f terraform.zip

ENTRYPOINT ["/bin/bash", "-c"]