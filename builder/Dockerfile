FROM httpd:alpine

RUN apk update && \
    apk add bash && \
    apk add php7 php7-fpm php7-opcache && \
    apk add ffmpeg && \
    apk add py-pip &&\
    pip install -U youtube-dl &&\
    apk add curl && \
    apk add openrc

RUN mkdir -p /home/download && \
    mkdir -p /home/scripts 
COPY --chown=root:root ./download-and-cut.sh /home/scripts

RUN chmod 700 -R /home/scripts/download-and-cut.sh && \
    rm -rf /usr/local/apache2/htdocs/index.html

