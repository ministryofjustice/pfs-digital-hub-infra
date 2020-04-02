---

hub_url: pfs-prod-hub-3.uksouth.cloudapp.azure.com
matomo_url: analytics.digital-hub.bwi.dpn.gov.uk
pikwik_url: https://analytics.digital-hub.bwi.dpn.gov.uk
#Used for compose override
drupal_url: https://pfs-prod-hub-3.uksouth.cloudapp.azure.com/sites/default/files
hub_backend_host: content.digital-hub.bwi.dpn.gov.uk
public_crt: ../docker/files/haproxy/prod/berwyn/berwyn.pem
#public_crt: ../docker/files/nginx/prod/Berwyn/san.digital-hub.crt
#private_rsa: ../docker/files/nginx/prod/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: "false"
nginx_conf: ../docker/files/nginx/template/nginx.conf.prod.j2
establishment_name: berwyn
FEATURE_NEW_DESIGNS: "true"
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.nomis-api.service.justice.gov.uk
DOMAIN: "bwi.dpn.gov.uk"
DOMAIN_CONTROLLER: "bwi.dpn.gov.uk"
ANALYTICS_ENDPOINT: "https://www.google-analytics.com/collect"
ANALYTICS_SITE_ID: "UA-152065860-4"
FEEDBACK_URL: "http://pfs-management-digital-hub-1.pfs-management.com/test-feedback/_doc"
