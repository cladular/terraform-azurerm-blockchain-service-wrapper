variable "resource_group_name" {
  type        = string
  description = "Resource group name."
}

variable "location" {
  type        = string
  description = "The GEO location of the blockchain service."
}

variable "member_name" {
  type        = string
  description = "Blockchain memeber name."
}

variable "protocol" {
  type        = string
  default     = "Quorum"
  description = "the blockchain protocol (NotSpecified, Parity, Quorum, Corda)."

  validation {
    condition     = var.protocol == "NotSpecified" || var.protocol == "Parity" || var.protocol == "Quorum" || var.protocol == "Corda"
    error_message = "Protocol can either be \"NotSpecified\", \"Parity\", \"Quorum\", \"Corda\". Defaults to \"Quorum\"."
  }
}

variable "member_password" {
  type        = string
  description = "The basic auth password of the blockchain member."
}

variable "consortium_name" {
  type        = string
  description = "The consortium for the blockchain member."
}

variable "consortium_management_account_password" {
  type        = string
  description = "The managed consortium management account password."
}

variable "firewall_rules" {
  type = list(object({
    ruleName       = string
    startIpAddress = string
    endIpAddress   = string
  }))
  description = "Firewall rules"
}
