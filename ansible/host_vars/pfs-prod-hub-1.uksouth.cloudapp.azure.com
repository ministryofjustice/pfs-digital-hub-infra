---

hub_url: pfs-prod-hub-2.uksouth.cloudapp.azure.com
matomo_url: matomo.pfs-prod-hub-2.uksouth.cloudapp.azure.com:12001
pikwik_url: examples.com
#Used for compose override
drupal_url: http://pfs-prod-hub-2.uksouth.cloudapp.azure.com:11001/sites/default/files
hub_backend_host: drupal.pfs-prod-hub-2.uksouth.cloudapp.azure.com
public_crt: ../docker/files/nginx/prod/wayland/public.crt
private_rsa: ../docker/files/nginx/prod/wayland/private.rsa
app_name: HMP Wayland
feature_switch: false