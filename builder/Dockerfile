FROM php:7.4-apache

RUN apt-get -y update && \
    apt-get install -y ffmpeg && \
    apt-get install -y python-pip &&\
    pip install -U youtube-dl &&\
    apt-get install -y curl 
    
RUN mkdir -p /home/download && \
    mkdir -p /home/scripts 
COPY --chown=root:root ./download-and-cut.sh /home/scripts
COPY --chown=root:root ./php/info.php /var/www/html
COPY --chown=root:root ./php/action.php /var/www/html
RUN chmod 700 -R /home/scripts/download-and-cut.sh 

