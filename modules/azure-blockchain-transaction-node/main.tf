locals {
  node_template = jsondecode(templatefile("${path.module}/transaction-node.tpl", {
    member_name    = var.member_name
    node_name      = "${var.member_name}/${var.node_name}"
    node_password  = var.node_password
    firewall_rules = jsonencode(var.firewall_rules)
  }))
}
