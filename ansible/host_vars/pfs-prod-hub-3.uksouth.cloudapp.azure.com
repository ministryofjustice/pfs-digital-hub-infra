---

hub_url: pfs-prod-hub-3.uksouth.cloudapp.azure.com
matomo_url: http://foo.bar
pikwik_url: http://foo.bar
#Used for compose override
drupal_url: http://pfs-prod-hub-3.uksouth.cloudapp.azure.com
app_name: HMP Cookham Wood
feature_switch: "false"
nginx_conf: ../docker/files/nginx/template/nginx.conf.http.j2
establishment_name: cookhamwood
FEATURE_NEW_DESIGNS: ""
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: http://foo.bar
DOMAIN: "foo.bar"
DOMAIN_CONTROLLER: "foo.bar"
ANALYTICS_ENDPOINT: "https://www.google-analytics.com/collect"
ANALYTICS_SITE_ID: "UA-152065860-5"
FEEDBACK_URL: "http://pfs-management.dpn.gov.uk/api/feedback/prod-feedback/_doc"
npr_stream: "http://185.14.84.101:8000/stream.ogg"
npr_stream_endpoint: "/npr-stream"

nginx_cert_needed: false
nginx_config_crt: ""
nginx_config_rsa: ""
LDAP_CERT_PATH: "/etc/ssl/certs/root-ca-base64.cer"
LDAP_START_TLS: "true"
ldap_username_attribute: "cn"

feature_personalization: false

services: "hub-db hub-be hub-node hub-elasticsearch cadvisor nginx"
