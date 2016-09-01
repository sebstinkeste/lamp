FROM ubuntu:latest 
MAINTAINER SplashA 
RUN apt-get update && apt-get install -y  apache2 php  libapache2-mod-php  nano htop 

 
RUN mkdir -p /var/www/html/test.com/html && \   
    chown -R www-data: /var/www/html

RUN echo "<?php phpinfo();" > /var/www/html/test.com/html/index.php
COPY test.com.conf /etc/apache2/sites-available/test.com.conf
RUN a2ensite test.com.conf && a2dissite 000-default.conf

RUN echo "127.0.0.1   localhost www.test.com" >> /etc/hosts
 
EXPOSE 80 
CMD ['/etc/init.d/apache2','start']