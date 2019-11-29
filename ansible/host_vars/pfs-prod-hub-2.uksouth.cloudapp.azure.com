---

hub_url: digital-hub.bwi.dpn.gov.uk
matomo_url: analytics.digital-hub.bwi.dpn.gov.uk
pikwik_url: https://analytics.digital-hub.bwi.dpn.gov.uk
#Used for compose override
drupal_url: https://content.digital-hub.bwi.dpn.gov.uk/sites/default/files
hub_backend_host: content.digital-hub.bwi.dpn.gov.uk
public_crt: ../docker/files/nginx/prod/Berwyn/san.digital-hub.crt
private_rsa: ../docker/files/nginx/prod/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: "false"
nginx_conf: ../docker/files/nginx/template/nginx.conf.prod.j2
establishment_name: berwyn
FEATURE_NEW_DESIGNS: ""
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.nomis-api.service.justice.gov.uk
