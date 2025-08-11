FROM python:3.13-alpine@sha256:f196fd275fdad7287ccb4b0a85c2e402bb8c794d205cf6158909041c1ee9f38d

LABEL org.opencontainers.image.source=https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN apk add --no-cache --virtual .build-deps build-base && \
    pip install --requirement /deps/requirements.txt && \
    apk del --no-cache .build-deps && \
    true

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
