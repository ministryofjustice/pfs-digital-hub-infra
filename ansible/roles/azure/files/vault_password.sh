#!/bin/bash
#This is used to get the password from the vault, if this fails you need to run az login from terminal before re-running ansible
#unset HTTPS_PROXY
az keyvault secret show --name pfshub-storage-account-pw --vault-name pfs-hub-prod-hub-kv -o json 2>/dev/null | jq -rM '.value' | tr -d '\n'