---

hub_url: digital-hub.wli.dpn.gov.uk
matomo_url: analytics.digital-hub.wli.dpn.gov.uk
pikwik_url: https://analytics.digital-hub.wli.dpn.gov.uk
#Used for compose override
drupal_url: https://content.digital-hub.wli.dpn.gov.uk/sites/default/files
hub_backend_host: content.digital-hub.wli.dpn.gov.uk
private_rsa: ../docker/files/nginx/prod/Wayland/wli.digital-hub.rsa
app_name: HMP Wayland
feature_switch: "false"
nginx_conf: ../docker/files/nginx/template/nginx.conf.prod.j2
establishment_name: wayland
FEATURE_NEW_DESIGNS: "true"
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.nomis-api.service.justice.gov.uk
DOMAIN: "wli.dpn.gov.uk"
DOMAIN_CONTROLLER: "wli.dpn.gov.uk"
PHONE_SERVER: ""
PHONE_PORT: ""
PHONE_PASSPHRASE: ""
PHONE_ITERATIONS: ""
PHONE_SALT: ""
PHONE_IV: ""
LDAP_START_TLS: "false"
ANALYTICS_ENDPOINT: "https://www.google-analytics.com/collect"
ANALYTICS_SITE_ID: "UA-152065860-2"
