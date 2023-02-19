FROM python:3.10-alpine

COPY requirements.txt /deps/
RUN pip install --requirement /deps/requirements.txt

ENTRYPOINT ["/usr/local/bin/cfn-lint"]
