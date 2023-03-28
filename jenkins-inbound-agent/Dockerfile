FROM jenkins/inbound-agent:4.11-1-alpine-jdk11

ARG user=jenkins

USER root
COPY ./jenkins-agent /usr/local/bin/jenkins-agent
RUN chmod +x /usr/local/bin/jenkins-agent
USER ${user}

ENTRYPOINT ["/usr/local/bin/jenkins-agent"]