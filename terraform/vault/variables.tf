##Azure container registry

variable "rg-name" {
  default = "pfs-prod-hub-vault-services-rg"
}
variable "location" {
  default = "UK South"
}

variable "vault-name" {
  default = "pfs-hub-prod-hub-kv"

}
variable "ips" {
  type    = "list"
  default = ["217.33.148.210/32", "81.134.202.29/32"]
}


variable "storage_account_name" {
  default = "pfsvaultlogaprod"
}

