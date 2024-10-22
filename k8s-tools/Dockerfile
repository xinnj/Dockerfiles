ROM quay.io/buildah/stable:latest
RUN echo -e '\
[kubernetes]\n\
name=Kubernetes\n\
baseurl=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/\n\
enabled=1\n\
gpgcheck=1\n\
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/repodata/repomd.xml.key\
' > /etc/yum.repos.d/kubernetes.repo
RUN yum install -y kubectl helm awscli && \
    yum clean all && \
    rm -rf /var/cache/yum