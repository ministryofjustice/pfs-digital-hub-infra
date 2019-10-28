---

hub_url: digital-hub-bwi.dpn.gov.uk
matomo_url: analytics.digital-hub-bwi.dpn.gov.uk
pikwik_url: https://analytics.digital-hub-bwi.dpn.gov.uk
#Used for compose override
drupal_url: https://content.digital-hub-bwi.dpn.gov.uk/sites/default/files
hub_backend_host: content.digital-hub-bwi.dpn.gov.uk
public_crt: ../docker/files/nginx/prod/Berwyn/public.crt
private_rsa: ../docker/files/nginx/prod/Berwyn/private.rsa
app_name: HMP Berwyn
feature_switch: false

