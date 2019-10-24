variable "ips" {
  type    = "list"
  default = ["217.33.148.210", "81.134.202.29"]
}

variable "location" {
  default = "UK South"
}

variable "subnets" {
  type = "list"

  default = ["/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-prod-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-prod-core-vn/subnets/pfs-prod-app-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-prod-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-prod-core-vn/subnets/pfs-prod-web-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-prod-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-prod-core-vn/subnets/pfs-prod-data-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-stage-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-stage-core-vn/subnets/pfs-stage-web-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-stage-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-stage-core-vn/subnets/pfs-stage-data-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-stage-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-stage-core-vn/subnets/pfs-stage-app-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-dev-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-dev-core-vn/subnets/pfs-dev-web-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-dev-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-dev-core-vn/subnets/pfs-dev-data-sn",
    "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourceGroups/pfs-dev-core-rg/providers/Microsoft.Network/virtualNetworks/pfs-dev-core-vn/subnets/pfs-dev-app-sn",
  ]
}
