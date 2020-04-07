---

hub_url: digital-hub.bwi.dpn.gov.uk
matomo_url: analytics.digital-hub.bwi.dpn.gov.uk
pikwik_url: https://analytics.digital-hub.bwi.dpn.gov.uk
#Used for compose override
drupal_url: https://content.digital-hub.bwi.dpn.gov.uk/sites/default/files
hub_backend_host: content.digital-hub.bwi.dpn.gov.uk
private_rsa: ../docker/files/nginx/prod/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: "false"
nginx_conf: ../docker/files/nginx/template/nginx.conf.prod.j2
establishment_name: berwyn
FEATURE_NEW_DESIGNS: "true"
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.nomis-api.service.justice.gov.uk
DOMAIN: "bwi.dpn.gov.uk"
DOMAIN_CONTROLLER: "bwi.dpn.gov.uk"
PHONE_SERVER: ""
PHONE_PORT: ""
PHONE_PASSPHRASE: ""
PHONE_ITERATIONS: ""
PHONE_SALT: ""
PHONE_IV: ""
LDAP_START_TLS: "false"
ANALYTICS_ENDPOINT: "https://www.google-analytics.com/collect"
ANALYTICS_SITE_ID: "UA-152065860-1"
FEEDBACK_URL: "http://pfs-management.dpn.gov.uk/api/feedback/prod-feedback/_doc"
LDAP_CERT_PATH: "/etc/ssl/cacerts.pem"

nginx_cert_needed: true
nginx_config_crt: "- /etc/nginx/san.digital-hub.crt:/etc/letsencrypt/live/localhost/san.digital-hub.crt"
nginx_config_rsa: "- /etc/nginx/san.digital-hub.rsa:/etc/letsencrypt/live/localhost/san.digital-hub.rsa"