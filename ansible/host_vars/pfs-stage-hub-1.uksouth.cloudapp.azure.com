---

hub_url: pfs-stage-hub-1.uksouth.cloudapp.azure.com
matomo_url: matomo.pfs-stage-hub-1.uksouth.cloudapp.azure.com:12001
pikwik_url: examples.com
#Used for compose override
drupal_url: http://pfs-stage-hub-1.uksouth.cloudapp.azure.com:11001/sites/default/files
hub_backend_host: drupal.pfs-stage-hub-1.uksouth.cloudapp.azure.com
public_crt: ../docker/files/nginx/stage/Berwyn/san.digital-hub.crt
private_rsa: ../docker/files/nginx/stage/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: true
nginx_conf: ../docker/files/nginx/template/nginx.conf.stagedev.j2
establishment_name: berwyn