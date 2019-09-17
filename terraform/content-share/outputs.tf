####Outputs
output "Share_Name" {
  value       = "${azurerm_storage_share.pfs-prod-hub-content-share.name}"
  description = "name of the share"
}

output "storage_account" {
  value       = "${azurerm_resource_group.pfs-prod-digital-hub-content-rg.name}"
  description = "stage storage account"
}
