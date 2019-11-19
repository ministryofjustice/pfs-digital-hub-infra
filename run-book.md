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

### Terraform

https://github.com/ministryofjustice/pfs-digital-hub-infra
Depending on environment, increment the vm-count variable in the relevant environments [variables.tf](https://github.com/ministryofjustice/pfs-digital-hub-infra/blob/f9996ecdb9a026a6a9dd2428c41eac0e11f78b79/terraform/vm-environments/dev/variables.tf#L3-L5)


### SSH Config

If this is a new host, see the [user-management](https://github.com/ministryofjustice/pfs-digital-hub-infra/blob/master/ansible/README.md) section 

Your SSH keys will need adding to the environment by anyone who can run the Ansible. Updated need to be completed [here](https://github.com/ministryofjustice/pfs-digital-hub-infra/blob/master/ansible/group_vars/all.yml)


# General Documentation

### Volumes

Persistence between container deployments/restarts is handled with Docker volumes

Backend (CMS)

- Host: `/mnt/pfs-prod-digital-hub-content-share/hub/sites/default/files`
- Container: `/var/www/html/sites/default/files` 

Backend (DB)

- Host: `/data/hub-db`
- Container: `/var/lib/mysql`

Matomo

- Host: `/data/moj_dhub_matomo_config`
- Container: `/var/www/html/config`

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
