FROM python:3.10-alpine

LABEL org.opencontainers.image.source https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN pip install --requirement /deps/requirements.txt

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
