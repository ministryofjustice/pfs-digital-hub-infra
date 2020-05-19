#!/bin/bash
#Set date
HUB_PASSWORD="$(sudo docker exec hub-db printenv | grep MYSQL_PASSWORD)"

DATE=`date +%m-%d-%Y`
find_prison ()
{
 HOSTNAME=$(hostname)
 STAGING="pfs-stage-digital-hub-1"
 WAYLAND="pfs-prod-digital-hub-1"
 BERWYN="pfs-prod-digital-hub-2"
 COOKHAMWOOD="pfs-prod-digital-hub-3"
 if [ "$HOSTNAME" = "$WAYLAND" ]; then
         PRISON="wayland"
         echo "This server is running $PRISON"
 elif
         [ "$HOSTNAME" = "$BERWYN" ]; then
         PRISON="berwyn"
         echo "This server is running $PRISON"
 elif
         [ "$HOSTNAME" = "$COOKHAMWOOD" ]; then
         PRISON="cookhamwood"
         echo "This server is running $PRISON"
 elif   [ "$HOSTNAME" = "$STAGING" ]; then
         PRISON="STAGING"
         echo "This server is running $PRISON"
 fi
}
#call func
find_prison
echo "Content Function"
release_content ()
{
echo "evaluating"

 if   [ "$HOSTNAME" = "$STAGING" ]; then
 
echo "backing up db"  >> /etc/docker/scheduled-release.txt

echo "run a backup"

sudo docker exec hub-db /usr/bin/mysqldump -u hubdb_user --password="${HUB_PASSWORD//MYSQL_PASSWORD=}" hubdb > /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-db-backups/scheduled-content-release-$DATE.sql
echo "sleeping"
sleep 2m

 elif [ "$HOSTNAME" = "$WAYLAND" ] || [ "$HOSTNAME" = "$BERWYN" ] || [ "$HOSTNAME" = "$COOKHAMWOOD" ] ; then
echo "sleeping"
 sleep 2m
echo "restoring DB" >> /etc/docker/scheduled-release.txt
echo "run a release"

sudo docker exec -i hub-db mysql -u hubdb_user --password="${HUB_PASSWORD//MYSQL_PASSWORD=}" hubdb < /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-db-backups/scheduled-content-release-$DATE.sql

 fi
}
release_content
#take backup
#find files older than 7 days and delete from live storage. These are retained for a futher 7 days in the snapshots in Azure.
echo "Deleting old files"
find /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-db-backups/ -type f -name '*.sql' -mtime +7 -exec rm {} \;
