FROM prometheuscommunity/postgres-exporter:latest

COPY .my.cnf /.my.cnf

EXPOSE 9104