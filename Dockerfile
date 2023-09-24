FROM prom/mysqld-exporter:latest

# ENV MYSQL_USER=$MYSQL_USER
# ENV MYSQL_PASSWORD=$MYSQL_PASSWORD
# ENV MYSQL_PORT=$MYSQL_PORT
# ENV MYSQL_HOST=$MYSQL_HOST
# ENV MYSQL_DATABASE=$MYSQL_DATABASE

ENV MYSQLD_EXPORTER_PASSWORD=JTMSqRLFA18n2Mb6j44Q
# COPY .my.cnf /.my.cnf
ENV URL=containers-us-west-55.railway.app:7258/railway
EXPOSE 9104

ENTRYPOINT [ "/bin/mysqld_exporter" ]
CMD [ "--mysqld.address=${URL}", \
    "--mysqld.username=root", \
    "--tls.insecure-skip-verify"]