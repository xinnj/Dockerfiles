FROM alpine
RUN apk add --update curl kubectl && rm -rf /var/cache/apk/*
COPY linux-amd64/helm /usr/local/bin/