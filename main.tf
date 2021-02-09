module "azure_blockchain" {
  source = "./modules/azure-blockchain-member"

  resource_group_name                    = var.resource_group_name
  location                               = var.location
  sku_name                               = "B0"
  sku_tier                               = "Basic"
  member_name                            = var.member_name
  member_password                        = var.member_password
  protocol                               = var.protocol
  consortium_name                        = var.consortium_name
  consortium_management_account_password = var.consortium_management_account_password
  firewall_rules                         = var.firewall_rules
}
