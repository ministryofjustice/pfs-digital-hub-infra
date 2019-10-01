# Migrating Drupal database

## Get database password from the 'hub-be' container

`sudo docker exec hub-be sh -c printenv | grep HUB_DB_ENV_MYSQL_USERNAME`
`sudo docker exec hub-be sh -c printenv | grep HUB_DB_ENV_MYSQL_PASSWORD`

## Create database dump

`sudo docker exec hub-db /usr/bin/mysqldump -u <DB_USER> --password='<DB_PASS>' hubdb > ~/dump_yyyymmddhhmm.sql`

## Download database dump with SCP

`scp digital-hub-stage.hmpps.dsd.io:~/dump_yyyymmddhhmm.sql ./local/system/dir/dump.sql`

## Upload the database dump with SCP

`scp ./dump.sql user@host.com:`

## Apply dump to hub_db

`cat ./local/system/dir/dump.sql | docker exec hub-db mysql -u <DB_USER> --password=<DB_PASS> hubdb`

## Confirm success using docker logs

` docker logs hub-db` - Check for errors

