#!/bin/bash

service mariadb start

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`$SQL_DATABASE\`;
CREATE USER IF NOT EXISTS \`$SQL_USER\`@'%' IDENTIFIED BY '$SQL_PASS';
GRANT ALL PRIVILEGES ON \`$SQL_DATABASE\`.* TO \`$SQL_USER\`@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASS';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p"$SQL_ROOT_PASS" shutdown

exec mysqld_safe