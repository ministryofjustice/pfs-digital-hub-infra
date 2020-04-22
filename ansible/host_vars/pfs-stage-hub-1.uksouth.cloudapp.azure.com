---

hub_url: pfs-digital-hub-stage.hmpps.dsd.io
#matomo_url: analytics.pfs-digital-hub-stage.hmpps.dsd.io
matomo_url: analytics.pfs-digital-hub-stage.hmpps.dsd.io
pikwik_url: https://analytics.pfs-digital-hub-stage.hmpps.dsd.io
#Used for compose override
drupal_url: http://content.pfs-digital-hub-stage.hmpps.dsd.io/sites/default/files
hub_backend_host: content.pfs-digital-hub-stage.hmpps.dsd.io

app_name: HMP Berwyn
feature_switch: "true"
establishment_name: berwyn
FEATURE_NEW_DESIGNS: ""
MOCK_AUTH: "true"
NOMIS_API_ENDPOINT: https://gateway.t3.nomis-api.hmpps.dsd.io
DOMAIN: ""
PHONE_SERVER: ""
PHONE_PORT: ""
PHONE_PASSPHRASE: ""
PHONE_ITERATIONS: ""
PHONE_SALT: ""
PHONE_IV: ""
LDAP_START_TLS: "false"
ANALYTICS_ENDPOINT: "https://www.google-analytics.com/collect"
ANALYTICS_SITE_ID: "UA-152065860-4"
FEEDBACK_URL: "http://pfs-management-digital-hub-1.pfs-management.com/api/feedback/test-feedback/_doc"


private_rsa: ../docker/files/nginx/stage/Berwyn/san.digital-hub.rsa

#nginx
nginx_conf: ../docker/files/nginx/template/nginx.confg.stage.j2
nginx_server_names: pfs-digital-hub-stage.hmpps.dsd.io content.pfs-digital-hub-stage.hmpps.dsd.io analytics.pfs-digital-hub-stage.hmpps.dsd.io
nginx_cert_needed: false
nginx_config_crt: ""
nginx_config_rsa: ""

LDAP_CERT_PATH: "/etc/ssl/certs/root-ca-base64.cer"
LDAP_START_TLS: "false"
