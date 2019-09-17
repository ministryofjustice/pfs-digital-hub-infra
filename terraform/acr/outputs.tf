####Outputs
output "rg_name" {
  value       = "${azurerm_container_registry.acr}"
  description = "The name of the resource group"
}

output "ACR_Name" {
  value       = "${azurerm_container_registry.acr}"
  description = "ACR Name"
}
