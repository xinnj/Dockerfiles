FROM docker.io/jenkins/inbound-agent:3301.v4363ddcca_4e7-3-alpine3.21-jdk21

ARG user=jenkins

USER root
COPY ./jenkins-agent /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins-agent
RUN mkdir -p /Users/jenkins/agent && chown -R ${user}:${user} /Users/jenkins/agent
USER ${user}

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]