FROM python:3.12-alpine@sha256:e75de178bc15e72f3f16bf75a6b484e33d39a456f03fc771a2b3abb9146b75f8

LABEL org.opencontainers.image.source=https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN apk add --no-cache --virtual .build-deps build-base && \
    pip install --requirement /deps/requirements.txt && \
    apk del --no-cache .build-deps && \
    true

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
