FROM ubuntu_base

# From http://docs.docker.io/en/latest/examples/mongodb/
# we don’t want Ubuntu to complain about init not being available so we’ll divert
# /sbin/initctl to /bin/true so it thinks everything is working.
run dpkg-divert --local --rename --add /sbin/initctl
run ln -fs /bin/true /sbin/initctl

#Install MySQL client and server
run apt-get -y install mysql-client mysql-server

#Set the bind address in mysql.conf 
run sed -i -e"s/^bind-address\s*=\s*localhost/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# add ./supervisor.conf /etc/supervisor/conf.d/supervisor.conf

ADD ./startup.sh /opt/startup.sh

EXPOSE 3306

CMD ["/bin/bash", "/opt/startup.sh"]