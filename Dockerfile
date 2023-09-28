FROM prom/mysqld-exporter

COPY .my.cnf /.my.cnf

EXPOSE 9104