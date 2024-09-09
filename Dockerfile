FROM python:3.12-alpine@sha256:bb5d0ac04679d78a1258e7dfacdb4d9bdefe9a10480eaf9b4bb09445d076369f

LABEL org.opencontainers.image.source=https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN apk add --no-cache --virtual .build-deps build-base && \
    pip install --requirement /deps/requirements.txt && \
    apk del --no-cache .build-deps && \
    true

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
