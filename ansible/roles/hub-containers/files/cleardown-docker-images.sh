#!/bin/bash
#Set date
DATE=`date +%m-%d-%Y`

echo "Removing dangling images"
sudo docker rmi $(docker images | grep 'mojdigitalstudio/prisoner-content-hub-frontend') -f 

echo "System Prune"
sudo docker system prune -a -f 

echo "Sytem Prune volumes"
sudo docker system prune --volumes -f


