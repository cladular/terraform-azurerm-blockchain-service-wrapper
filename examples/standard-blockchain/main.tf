terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.46.1"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  deployment_name = "azbc"
  location        = "eastus"
  member_name     = "bcmember${local.deployment_name}"
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${local.deployment_name}-${local.location}"
  location = local.location
}

module "azure_blockchain_transaction_node1" {
  source  = "cladular/blockchain-service-wrapper/azurerm//modules/azure-blockchain-transaction-node"
  version = "0.0.1"

  member_name   = local.member_name
  node_name     = "bcnode1${local.deployment_name}"
  node_password = "!Q@W3e4r5t6y"
  firewall_rules = [{
    ruleName = "AllowAll"
    startIpAddress : "0.0.0.0",
    endIpAddress : "255.255.255.255"
  }]
}

module "azure_blockchain" {
  source  = "cladular/blockchain-service-wrapper/azurerm//modules/azure-blockchain-member"
  version = "0.0.1"

  resource_group_name                    = azurerm_resource_group.this.name
  location                               = azurerm_resource_group.this.location
  member_name                            = local.member_name
  sku_name                               = "S0"
  sku_tier                               = "Standard"
  member_password                        = "!Q@W3e4r5t6y"
  consortium_name                        = "bcconsortium${local.deployment_name}"
  consortium_management_account_password = "!Q@W3e4r5t6y"
  firewall_rules = [{
    ruleName = "AllowAll"
    startIpAddress : "0.0.0.0",
    endIpAddress : "255.255.255.255"
  }]
  transaction_nodes = [
    module.azure_blockchain_transaction_node1
  ]
}
