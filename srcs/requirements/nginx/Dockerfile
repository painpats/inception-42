FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

COPY tools/scripts.sh /usr/local/bin/scripts.sh
COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

ENTRYPOINT ["bash", "/usr/local/bin/scripts.sh"]