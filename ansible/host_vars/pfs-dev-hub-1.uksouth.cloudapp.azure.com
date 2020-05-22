---

hub_url: pfs-dev-hub-1.uksouth.cloudapp.azure.com
matomo_url: matomo.pfs-dev-hub-1.uksouth.cloudapp.azure.com:12001
pikwik_url: examples.com
#Used for compose override
drupal_url: http://pfs-dev-hub-1.uksouth.cloudapp.azure.com:11001
hub_backend_host: drupal.pfs-dev-hub-1.uksouth.cloudapp.azure.com
public_crt: ../docker/files/nginx/Dev/Berwyn/san.digital-hub.crt
private_rsa: ../docker/files/nginx/Dev/Berwyn/san.digital-hub.rsa
app_name: HMP Berwyn
feature_switch: "true"
nginx_conf: ../docker/files/nginx/template/nginx.conf.stagedev.j2
establishment_name: berwyn
FEATURE_NEW_DESIGNS: ""
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.t3.nomis-api.hmpps.dsd.io
DOMAIN: pfs-dev-ad.local
ANALYTICS_ENDPOINT: "https://www.google-analytics.com/collect"
ANALYTICS_SITE_ID: "UA-152065860-4"
FEEDBACK_URL: "http://pfs-management-digital-hub-1.pfs-management.com/api/feedback/test-feedback/_doc"
npr_stream: "http://185.14.84.101:8000/stream.ogg"
npr_stream_endpoint: "/npr-stream"


#ldap section
LDAP_CERT_PATH: "/etc/ssl/certs/root-ca-base64.cer"
LDAP_START_TLS: "true"
ldap_username_attribute: "cn"

nginx_config_crt: "- /etc/nginx/san.digital-hub.crt:/etc/letsencrypt/live/localhost/san.digital-hub.crt"
nginx_config_rsa: "- /etc/nginx/san.digital-hub.rsa:/etc/letsencrypt/live/localhost/san.digital-hub.rsa"

feature_personalization: true

services: "hub-db hub-be hub-node hub-elasticsearch cadvisor nginx"
