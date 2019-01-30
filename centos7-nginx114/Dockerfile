ARG CENTOS_VERSION
FROM centos:$CENTOS_VERSION

ARG RPM_NAME

LABEL maintainer=armin.heller@qaware.de

# Make the /etc/passwd writable. This is necessary to add the OpenShift User.
USER root
RUN chmod g=u /etc/passwd; \
    chmod g+w /home

RUN mkdir -p /home/osuser; \
    chmod g+rw /home/osuser

# OpenSSL is required by Nginx
RUN yum -q -y install openssl

RUN yum -q -y install tcpdump

# Install nginx rpm package
RUN rpm -q nginx || rpm -Uvh http://nginx.org/packages/centos/$RPM_NAME.ngx.x86_64.rpm
RUN rpm -qi nginx

# Override the nginx config
COPY etc/nginx /etc/nginx/
COPY etc/entrypoint.sh .

RUN adduser nginxuser; \
    echo nginxuser:nginxuser | chpasswd;

RUN chmod -R 777 /var/log/nginx /var/cache/nginx /var/run \
     && chgrp -R 0 /etc/nginx \
     && chmod -R g+rwX /etc/nginx

USER nginxuser

EXPOSE 8080 8081

ENTRYPOINT ["./entrypoint.sh"]
