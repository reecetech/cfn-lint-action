FROM python:3.12-alpine@sha256:ae35274f417fc81ba6ee1fc84206e8517f28117566ee6a04a64f004c1409bdac

LABEL org.opencontainers.image.source https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN pip install --requirement /deps/requirements.txt

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
