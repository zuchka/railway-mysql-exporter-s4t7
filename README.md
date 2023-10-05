## MySQL Metrics Collector for Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/H5G_9i?referralCode=9kQOPq)

## How to replace user `root` with user `exporter`

This template will work immediately on any railway project that has a MySQL database deployed. However, it uses the `root` user for access, which is not ideal.

For better security, you should set up a dedicated `exporter` user in your MySQL DB. The following are detailed instructions for setting that up and adjusting the Railway environmental variables:

1) log into your MySQL DB locally using Railway's connection procedures. These are listed in your MySQL details page.

2) run the following commands to create a new user named `exporter`. Be sure to replace `XXXXXXXX` with a strong password of your choosing:

```sql
CREATE USER 'exporter'@'localhost' IDENTIFIED BY 'XXXXXXXX' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'exporter'@'localhost';
```

3) Return to the Railway UI. Navigate to your MySQL Collector service and add one new environmental variable: create a key called `MYSQL_EXPORT_PASSWORD` and set the value to your new password. The `MYSQL_EXPORT_USER` variable is already set to `exporter`.

4) Update the `Dockerfile` and the `.my.cnf` file in your github repo. The appropriate replacement lines are already present, but commented out. Comment-out the old lines and uncomment these new lines. Push your changes. Railway will redeploy the collector with the new settings. Your collector is now using a dedicated `exporter` user instead of the `root` user!
