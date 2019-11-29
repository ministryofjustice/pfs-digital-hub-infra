---
hub_url: pfs-dev-hub-2.uksouth.cloudapp.azure.com
matomo_url: matomo.pfs-dev-hub-2.uksouth.cloudapp.azure.com:12001
pikwik_url: examples.com
#Used for compose override
drupal_url: http://pfs-dev-hub-2.uksouth.cloudapp.azure.com:11001/sites/default/files
hub_backend_host: drupal.pfs-dev-hub-2.uksouth.cloudapp.azure.com
public_crt: ../docker/files/nginx/stage/wayland/public.crt
private_rsa: ../docker/files/nginx/stage/wayland/private.rsa
app_name: HMP Wayland
feature_switch: "false"
FEATURE_NEW_DESIGNS: ""
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.t3.nomis-api.hmpps.dsd.io
