FROM alpine:3.10
RUN apk add --update --no-cache \
    docker \
    python3-dev && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi \
  && apk add --update --virtual build-dep \
    build-base \
    libxml2-dev \
    libxslt-dev \
    zlib-dev \
    linux-headers \
  && pip install --upgrade pip \
  && pip install cwltool==1.0.20191022103248 \
  && apk del build-dep
