FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/scripts.sh /usr/local/bin/scripts.sh
RUN chmod 755 /usr/local/bin/scripts.sh

EXPOSE 3306


ENTRYPOINT ["bash", "/usr/local/bin/scripts.sh"]