variable "member_name" {
  type        = string
  description = "Blockchain memeber name."
}

variable "node_name" {
  type        = string
  description = "Transaction node name."
}

variable "node_password" {
  type        = string
  description = "The transaction node dns endpoint basic auth password."
}

variable "firewall_rules" {
  type = list(object({
    ruleName       = string
    startIpAddress = string
    endIpAddress   = string
  }))
  description = "Firewall rules"
}

