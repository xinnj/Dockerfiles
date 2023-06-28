FROM alpine
LABEL maintainer='xinnj@hotmail.com'

RUN apk add --no-cache \
    openssh-client \
    sshpass \
    expect \
    sudo \
    gettext

RUN adduser -D jenkins \
    && echo 'jenkins ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER jenkins
WORKDIR /home/jenkins

ADD --chown=jenkins:jenkins --chmod=755 ssh-expect /home/jenkins/
ADD --chown=jenkins:jenkins --chmod=755 ssh-copy-id-win /home/jenkins/
ADD --chown=jenkins:jenkins --chmod=755 Start.sh /home/jenkins/

RUN mkdir -p ~/.ssh \
    && touch ~/.ssh/authorized_keys \
    && touch ~/.ssh/config \
    && chmod 700 ~/.ssh \
    && chmod 600 ~/.ssh/config \
    && chmod 600 ~/.ssh/authorized_keys \
    && echo "Host *" >> ~/.ssh/config \
    && echo "    StrictHostKeyChecking no" >> ~/.ssh/config \
    && echo "    UserKnownHostsFile=~/.ssh/known_hosts" >> ~/.ssh/config

RUN ssh-keygen -t rsa -f /home/jenkins/.ssh/id_rsa -q -N "" \
    && chmod 600 /home/jenkins/.ssh/id_rsa

ENV SSH_KEY=/home/jenkins/.ssh/id_rsa
ENV REMOTE_HOST=
ENV REMOTE_PORT=22
ENV REMOTE_TYPE=linux
ENV USERNAME=
ENV PASSWORD=
ENV REMOTE_COMMANDS=

CMD ./Start.sh