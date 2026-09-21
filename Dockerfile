FROM python:3.14-alpine@sha256:016508ba505da24f7139765bc4bb669df4e88eb2f12eeadd571bf2f88d7533df

LABEL org.opencontainers.image.source=https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN apk add --no-cache --virtual .build-deps build-base && \
    pip install --requirement /deps/requirements.txt && \
    apk del --no-cache .build-deps && \
    true

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
