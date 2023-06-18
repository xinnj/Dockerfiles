FROM alpine

RUN addgroup -g 1000 uploader && adduser -D -u 1000 -G uploader uploader && echo 'uploader:PleaseUploadHere' | chpasswd
RUN mkdir /data && chown uploader:uploader /data

# install samba server
RUN apk add --no-cache samba tzdata

COPY smb.conf /etc/samba/
RUN echo -e "PleaseUploadHere\nPleaseUploadHere" | smbpasswd -a -s -c /etc/samba/smb.conf uploader
RUN ln -sf /dev/stdout /var/log/samba/log.smbd

WORKDIR /data

EXPOSE 445
VOLUME /data

CMD /usr/sbin/smbd --foreground -d1 --no-process-group