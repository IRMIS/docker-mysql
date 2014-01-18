#/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then

        mysql_install_db

        /usr/bin/mysqld_safe &
        sleep 10s

        echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

        echo "CREATE DATABASE irmis"

        killall mysqld
        sleep 10s
fi

/usr/bin/mysqld_safe