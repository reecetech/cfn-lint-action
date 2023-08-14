FROM python:3.10-alpine@sha256:5d1dafb473686c5435faed90387956d6f1fdd919e4ced85eb2aa5ac45d29a98c

LABEL org.opencontainers.image.source https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN pip install --requirement /deps/requirements.txt

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
