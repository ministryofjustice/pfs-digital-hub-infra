:set fileformat=unix
#!/bin/sh
#Set date
HUB_PASSWORD="$(sudo docker exec hub-db printenv | grep MYSQL_PASSWORD)"
MATOMO_PASSWORD="$(sudo docker exec hub-matomo-db printenv | grep MYSQL_PASSWORD)"
MATOMO_USER="$(sudo docker exec hub-matomo-db printenv | grep MYSQL_USER)"
DATE=`date +%m-%d-%Y`
find_prison ()
{
 HOSTNAME=$(hostname)
 WAYLAND="pfs-prod-digital-hub-1"
 BERWYN="pfs-prod-digital-hub-2"
 if [ "$HOSTNAME" = "$WAYLAND" ]; then
         PRISON="wayland"
         echo "This server is running $PRISON"
 elif
         [ "$HOSTNAME" = "$BERWYN" ]; then
         PRISON="berwyn"
         echo "This server is running $PRISON"
 fi
}
#call func
find_prison
#debugging only
echo "${HUB_PASSWORD//MYSQL_PASSWORD=}"
#take db backup
sudo docker exec hub-db /usr/bin/mysqldump -u hubdb_user --password="${HUB_PASSWORD//MYSQL_PASSWORD=}" hubdb > /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-db-backups/$PRISON-$DATE.sql
#debug
echo "Backing up Matomo"
echo "${MATOMO_PASSWORD//MYSQL_PASSWORD=}"
echo "${MATOMO_USER//MYSQL_USER=}"

#take backup
sudo docker exec hub-matomo-db /usr/bin/mysqldump -u "${MATOMO_USER//MYSQL_USER=}" --password="${MATOMO_PASSWORD//MYSQL_PASSWORD=}" matomo > /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-matomo-backups/$PRISON-$DATE.sql
#find files older than 7 days and delete from live storage. These are retained for a futher 7 days in the snapshots in Azure.
echo "Deleting old files"
find /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-matomo-backups/ -type f -name '*.sql' -mtime +7 -exec rm {} \;
find /mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files/databases/hub-db-backups/ -type f -name '*.sql' -mtime +7 -exec rm {} \;