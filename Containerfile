FROM fedora:latest
RUN dnf -yqq install httpd && \
    /bin/mkdir /structure && \
    /bin/chmod 777 /structure && \
    /usr/sbin/useradd -u 5000 collin
COPY index.html /var/www/html
USER sync
RUN /bin/mkdir /structure/sync-work
USER nobody
RUN /bin/mkdir /structure/nobody-work
USER root
ENTRYPOINT /usr/sbin/httpd -DFOREGROUND
#EXPOSE 8080:80
EXPOSE 80
