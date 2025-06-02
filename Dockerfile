FROM python:3.13-alpine@sha256:a94caf6aab428e086bc398beaf64a6b7a0fad4589573462f52362fd760e64cc9

LABEL org.opencontainers.image.source=https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN apk add --no-cache --virtual .build-deps build-base && \
    pip install --requirement /deps/requirements.txt && \
    apk del --no-cache .build-deps && \
    true

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
