---

hub_url: digital-hub.wli.dpn.gov.uk
matomo_url: analytics.digital-hub.wli.dpn.gov.uk
pikwik_url: https://analytics.digital-hub.wli.dpn.gov.uk
#Used for compose override
drupal_url: https://content.digital-hub.wli.dpn.gov.uk/sites/default/files
hub_backend_host: content.digital-hub.wli.dpn.gov.uk
#public_crt: ../docker/files/nginx/prod/Wayland/wli.digital-hub.crt
public_crt: ../docker/files/haproxy/prod/wayland/key.pem
#private_rsa: ../docker/files/nginx/prod/Wayland/wli.digital-hub.rsa
app_name: HMP Wayland
feature_switch: "false"
haproxy_cfg: ../docker/files/haproxy/template/haproxy.cfg.j2
establishment_name: wayland
FEATURE_NEW_DESIGNS: "true"
MOCK_AUTH: ""
NOMIS_API_ENDPOINT: https://gateway.nomis-api.service.justice.gov.uk
DOMAIN: "wli.dpn.gov.uk"
DOMAIN_CONTROLLER: "wli.dpn.gov.uk"