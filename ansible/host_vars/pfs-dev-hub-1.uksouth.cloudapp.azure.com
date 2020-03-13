---

hub_url: pfs-dev-hub-1.uksouth.cloudapp.azure.com
matomo_url: matomo.pfs-dev-hub-1.uksouth.cloudapp.azure.com:12001
pikwik_url: examples.com
#Used for compose override
drupal_url: http://pfs-dev-hub-1.uksouth.cloudapp.azure.com:11001/sites/default/files
hub_backend_host: drupal.pfs-dev-hub-1.uksouth.cloudapp.azure.com
public_crt: ../docker/files/nginx/Dev/Berwyn/san.digital-hub.crt
private_rsa: ../docker/files/nginx/Dev/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: "true"
nginx_conf: ../docker/files/nginx/template/nginx.conf.stagedev.j2
establishment_name: berwyn
FEATURE_NEW_DESIGNS: "true"
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.t3.nomis-api.hmpps.dsd.io
DOMAIN: pfs-dev-ad.local
PHONE_SERVER: ""
PHONE_PORT: ""
PHONE_PASSPHRASE: ""
PHONE_ITERATIONS: ""
PHONE_SALT: ""
PHONE_IV: ""
LDAP-START-TLS: "false"