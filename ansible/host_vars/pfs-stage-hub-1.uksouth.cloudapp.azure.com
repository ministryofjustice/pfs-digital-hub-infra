---

#hub_url: digital-hub-stage.hmpps.dsd.io
hub_url: pfs-stage-hub-1.uksouth.cloudapp.azure.com
#matomo_url: matomo.pfs-stage-hub-1.uksouth.cloudapp.azure.com:12001
matomo_url: analytics.digital-hub-stage.hmpps.dsd.io:12001
pikwik_url: https://analytics.digital-hub-stage.hmpps.dsd.io
#Used for compose override
drupal_url: http://pfs-stage-hub-1.uksouth.cloudapp.azure.com:11001/sites/default/files
#drupal_url: https://content.digital-hub-stage.hmpps.dsd.io/sites/default/files
hub_backend_host: content.digital-hub-stage.hmpps.dsd.io
public_crt: ../docker/files/haproxy/prod/berwyn/key.pem
private_rsa: ../docker/files/nginx/stage/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: "true"
nginx_conf: ../docker/files/nginx/template/nginx.confg.stage.j2
establishment_name: berwyn
FEATURE_NEW_DESIGNS: "true"
MOCK_AUTH: "true"
NOMIS_API_ENDPOINT: https://gateway.t3.nomis-api.hmpps.dsd.io
DOMAIN: ""
PHONE_SERVER: ""
PHONE_PORT: ""
PHONE_PASSPHRASE: ""
PHONE_ITERATIONS: ""
PHONE_SALT: ""
PHONE_IV: ""
LDAP-START-TLS: "false"
