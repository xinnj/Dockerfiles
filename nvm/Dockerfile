FROM alpine
RUN apk add --update curl && rm -rf /var/cache/apk/*
ENV NVM_DIR /nvm
WORKDIR /
RUN wget https://github.com/nvm-sh/nvm/archive/refs/tags/v0.39.3.zip && unzip v0.39.3.zip && mv nvm-0.39.3 nvm && rm -rf v0.39.3.zip
WORKDIR /nvm
RUN ln -s /home/jenkins/agent/nvm/versions versions
RUN \. "./nvm.sh"