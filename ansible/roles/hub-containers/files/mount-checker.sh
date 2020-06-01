#!/bin/bash
if grep -qs '/mnt/pfs-prod-digital-hub-content-share' /proc/mounts; then
    echo "It's mounted..."
    echo "its mounted"  >> /etc/docker/cron.txt
else
    echo "It's not mounted. Force remount and restart hub-be post check"
    sudo mount /mnt/pfs-prod-digital-hub-content-share
    sudo docker restart hub-be
    echo "its now mounted"  >> /etc/docker/cron.txt
    
fi

