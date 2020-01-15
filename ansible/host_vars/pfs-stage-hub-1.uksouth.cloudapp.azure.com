---

hub_url: pfs-stage-hub-1.uksouth.cloudapp.azure.com
matomo_url: matomo.pfs-stage-hub-1.uksouth.cloudapp.azure.com:12001
pikwik_url: examples.com
#Used for compose override
drupal_url: http://pfs-stage-hub-1.uksouth.cloudapp.azure.com:11001/sites/default/files
hub_backend_host: drupal.pfs-stage-hub-1.uksouth.cloudapp.azure.com
public_crt: ../docker/files/haproxy/prod/berwyn/key.pem
#private_rsa: ../docker/files/nginx/stage/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: "true"
haproxy_cfg: ../docker/files/haproxy/template/haproxy_dev_stage.cfg.j2
establishment_name: berwyn
FEATURE_NEW_DESIGNS: "true"
MOCK_AUTH: "true"
NOMIS_API_ENDPOINT: https://gateway.t3.nomis-api.hmpps.dsd.io
DOMAIN: ""