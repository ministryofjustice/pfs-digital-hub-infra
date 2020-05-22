---

hub_url: pfs-digital-hub-stage.hmpps.dsd.io
#matomo_url: analytics.pfs-digital-hub-stage.hmpps.dsd.io
matomo_url: analytics.pfs-digital-hub-stage.hmpps.dsd.io
pikwik_url: https://analytics.pfs-digital-hub-stage.hmpps.dsd.io
#Used for compose override
drupal_url: https://content.pfs-digital-hub-stage.hmpps.dsd.io
hub_backend_host: content.pfs-digital-hub-stage.hmpps.dsd.io

app_name: HMP Berwyn
feature_switch: "true"
establishment_name: berwyn
FEATURE_NEW_DESIGNS: ""
MOCK_AUTH: "true"
NOMIS_API_ENDPOINT: https://gateway.t3.nomis-api.hmpps.dsd.io
DOMAIN: ""
ANALYTICS_ENDPOINT: "https://www.google-analytics.com/collect"
ANALYTICS_SITE_ID: "UA-152065860-4"
FEEDBACK_URL: "http://pfs-management-digital-hub-1.pfs-management.com/api/feedback/test-feedback/_doc"
npr_stream: "http://185.14.84.101:8000/stream.ogg"
npr_stream_endpoint: "/npr-stream"


private_rsa: ../docker/files/nginx/stage/Berwyn/san.digital-hub.rsa

#nginx
nginx_conf: ../docker/files/nginx/template/nginx.confg.stage.j2
nginx_server_names: pfs-digital-hub-stage.hmpps.dsd.io content.pfs-digital-hub-stage.hmpps.dsd.io analytics.pfs-digital-hub-stage.hmpps.dsd.io
nginx_cert_needed: false
nginx_config_crt: ""
nginx_config_rsa: ""

LDAP_START_TLS: "false"
LDAP_CERT_PATH: "/etc/ssl/certs/root-ca-base64.cer"
ldap_username_attribute: "cn"

feature_personalization: true

services: "hub-db hub-be hub-node hub-elasticsearch cadvisor nginx certbot"
