FROM alpine
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v$(cut -d'.' -f1,2 /etc/alpine-release)/community/" >> /etc/apk/repositories
RUN apk add --update curl bash && rm -rf /var/cache/apk/*

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    mv kubectl /usr/bin/kubectl && \
    chmod +x /usr/bin/kubectl

RUN curl -LO "https://get.helm.sh/helm-v3.15.0-linux-amd64.tar.gz" && \
    tar -zxvf helm-v3.15.0-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/bin/helm && \
    chmod +x /usr/bin/helm && \
    rm -rf helm-v3.15.0-linux-amd64.tar.gz linux-amd64
