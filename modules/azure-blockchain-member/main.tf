resource "azurerm_resource_group_template_deployment" "this" {
  name                = "${var.consortium_name}-${var.member_name}-deployment"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  template_content = templatefile("${path.module}/member.tpl", {
    location                               = var.location
    member_name                            = var.member_name
    sku_name                               = var.sku_name
    sku_tier                               = var.sku_tier
    protocol                               = var.protocol
    capacity                               = var.capacity
    member_password                        = var.member_password
    consortium_name                        = var.consortium_name
    consortium_management_account_password = var.consortium_management_account_password
    consortium_role                        = var.consortium_role
    consortium_member_display_name         = var.consortium_member_display_name
    firewall_rules                         = jsonencode(var.firewall_rules)
    transaction_nodes                      = jsonencode(var.transaction_nodes[*].node_template)
  })
}
