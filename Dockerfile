FROM python:3.11-alpine@sha256:cd311c6a0164f34a7edbf364e05258b07d66d3f7bc155139dcb9bef88a186ded

LABEL org.opencontainers.image.source https://github.com/reecetech/cfn-lint-action

COPY requirements.txt /deps/
RUN pip install --requirement /deps/requirements.txt

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
