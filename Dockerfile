FROM prom/mysqld-exporter

COPY .my.cnf /.my.cnf

EXPOSE 9104

ENTRYPOINT [ "/bin/mysqld_exporter" ]
CMD        [ "--mysqld.address=$MYSQLHOST:$MYSQLPORT", \
             "--mysqld.username=$MYSQLUSER"]

# YOU REALLY SHOULDN'T USE ROOT FOR THIS.
# REPLACE THE ABOVE 'CMD' WITH THE FOLLOWING 'CMD' IF 
# YOU SET UP A DEDICATED 'EXPORTER' USER IN MYSQL.
# SEE THE README FOR DETAILED INSTRUCTIONS

# CMD        [ "--mysqld.address=$MYSQLHOST:$MYSQLPORT", \
#              "--mysqld.username=$MYSQL_EXPORT_USER"]