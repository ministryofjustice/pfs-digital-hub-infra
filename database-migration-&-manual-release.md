Database Restore / Migration / Release 
=======================

The easiest way to get a database restore from production to your own local host is to use [Storage-Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/)

Once installed, go to Azure and get a Connection String from Azure ( Azure >  Storage Accounts > pfsprodhubstorageacc > Access Keys > Connection String )

Use this connection string to connect via Azure Storage Explorer. Browse to pfsprodhubstorageacc/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-db-backups and download the latest file to your machine.

To restore run `HUB_PASSWORD="$(sudo docker exec hub-db printenv | grep MYSQL_PASSWORD)"` on your host and obtain the password for the MYSQL.

Then run `docker exec -i hub-db mysql -u hubdb_user --password="${HUB_PASSWORD//MYSQL_PASSWORD=}" hubdb < database.file.name.sql`

Production release from Staging
=======================

This is temp till circle CI is up and running

SSH onto staging

Take a backup of staging;

`HUB_PASSWORD="$(sudo docker exec hub-db printenv | grep MYSQL_PASSWORD)"`

`sudo docker exec hub-db /usr/bin/mysqldump -u hubdb_user --password="${HUB_PASSWORD//MYSQL_PASSWORD=}" hubdb > /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-db-backups/$PRISON-$DATE.sql`

SSH onto Production

`HUB_PASSWORD="$(sudo docker exec hub-db printenv | grep MYSQL_PASSWORD)"`

`sudo docker exec -i hub-db mysql -u hubdb_user --password="${HUB_PASSWORD//MYSQL_PASSWORD=}" hubdb < /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/database.restore.file.name.sql`



