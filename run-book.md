# HUB Run Book

## Prerequisites

### Software

The following software should be present on the host machine

```
Docker
Git
SCP
Terraform (New Environment only)
Azure Storage Explorer (Optional)
```

## Setting up a new environment from scratch in Azure (automation tbc)

### Terraform

TBC


### SSH Config

TBC

### Update the host

#Update Ubuntu

`sudo apt-get update`

#Upgrade

`sudo apt-get upgrade`

## Install Docker and Docker Compose

Install Docker

`sudo apt-get install -y docker.io`

Enable Docker

`sudo systemctl enable docker`

Start Docker

`sudo systemctl start docker`


## Remove the sudo requirements

`sudo gpasswd -a $USER docker`

### Environment variables

The following environment variables need to be set on the host machine, these are picked up by Docker-Compose at run time

```
export ENV_VAR_NAME=XYZ
```

NOTE: SendEnv

```
Environment variables sent using SendEnv via SSH need to be configured in /etc/ssh/sshd_config using;

AcceptEnv ENV_VARIABLE_NAME
```

```
HUB_DB_ENV_MYSQL_PASSWORD
MYSQL_PASSWORD  // Should be the same as HUB_DB_ENV_MYSQL_PASSWORD
MATOMO_TOKEN
HUB_MATOMO_MYSQL_USER_PASSWORD
HUB_MATOMO_MYSQL_ROOT_PASSWORD
HUB_MATOMO_MYSQL_USER_USERNAME
NOMIS_API_TOKEN
```

## Install Docker Compose

`sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`

Edit Permissions to allow docker-compose to run

`sudo chmod +x /usr/local/bin/docker-compose`

## Create container mounts

`sudo mkdir /data`

`sudo chown $USER /data`


## Create Azure Storage Mount

Make the mount for the share

`mkdir -p /mnt/pfs-hub-content-share`

 Mount the share using secure credentials  - you will need to obtain this from the dev ops team
 `sudo do mount -t cifs //$STORAGEACCOUNT.file.core.windows.net/pfs-hub-content-share /mnt/pfs-hub-content-share -o vers=3.0,username=STORAGEACCOUNT,password=$PASSWORD,dir_mode=0777,file_mode=0777,serverino`

Update the fstab to allow mounts to be perm

`sudo vim fstab`

Add the mount to the file

`//$STORAGEACCOUNT.file.core.windows.net/pfs-hub-content-share /mnt/pfs-hub-content-share cifs vers=3.0,username=$STORAGEACCOUNT,password=$PASSWORD,dir_mode=0777,file_mode=0777`

Whats ASN

## Install the containers

SCP the docker-compose.staging.yml and docker-compose.yml to the server

`scp $filename $HOSTNAME:`

Start The docker containers

`docker-compose -f docker-compose.yml -f docker-compose.staging.yml up -d`







Export on Linux/Mac

```
export ENV_VAR_NAME=XYZ
```

NOTE: SendEnv

```
Environment variables sent using SendEnv via SSH need to be configured in /etc/ssh/sshd_config using;

AcceptEnv ENV_VARIABLE_NAME
```

# General Documentation

### Volumes

Persistence between container deployments/restarts is handled with Docker volumes

Backend (CMS)

- Host: `/content/moj_dhub_prod001_app/usr/share/nginx/html/moj_be/sites/default/files`
- Container: `/var/www/html/sites/default/files` - This is not used in the Azure version above. It is replaced by the Azure Storage

Backend (DB)

- Host: `/data/hub-db`
- Container: `/var/lib/mysql`

Matomo

- Host: `/data/moj_dhub_matomo_config`
- Container: `/var/www/html/config`

Note: currently these volumes (data & content) are mounted from `root@digital-hub-stage/`
the docker-compose.yml and associated site compose file are at `jenkins@digital-hub-stage`

## Running the application

### Clone repositories

```
git clone git@github.com:ministryofjustice/digital-hub.git
```

### Launch Docker-Compose

```
docker-compose pull && docker-compose -f docker-compose.yml -f docker-compose.${site}.yml up -d
```

### Apply database backup

As per database-migration.md
