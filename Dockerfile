FROM alpine:3.8
RUN apk add --update --no-cache \
    python-dev \
    py-pip \
    docker \
  && apk add --update --virtual build-dep \
    build-base \
    libxml2-dev \
    libxslt-dev \
    zlib-dev \
    linux-headers \
  && pip install --upgrade pip \
  && pip install cwltool==1.0.20191022103248 \
  && apk del build-dep
