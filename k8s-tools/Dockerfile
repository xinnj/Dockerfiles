FROM alpine
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/" >> /etc/apk/repositories
RUN apk add --update curl kubectl && rm -rf /var/cache/apk/*
COPY linux-amd64/helm /usr/local/bin/