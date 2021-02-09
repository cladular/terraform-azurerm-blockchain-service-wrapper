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

variable "sku_name" {
  type        = string
  description = "Sku name (S0 for Standard and B0 for Basic)."

  validation {
    condition     = var.sku_name == "S0" || var.sku_name == "B0"
    error_message = "SKU name can either be \"S0\" (for standard) or \"B0\" (for basic)."
  }
}

variable "sku_tier" {
  type        = string
  description = "Sku tier (Basic or Standard)."

  validation {
    condition     = var.sku_tier == "Standard" || var.sku_tier == "Basic"
    error_message = "SKU tier can either be \"Standard\" or \"Basic\"."
  }
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

variable "capacity" {
  type        = number
  default     = 1
  description = "The nodes capacity."

  validation {
    condition     = var.capacity == 1 || var.capacity == 2
    error_message = "SKU tier can either be 1 or 2. Defaults to 1."
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

variable "consortium_role" {
  type        = string
  default     = ""
  description = "The role of the member in the consortium."
}

variable "consortium_member_display_name" {
  type        = string
  default     = ""
  description = "The display name of the member in the consortium."
}

variable "firewall_rules" {
  type = list(object({
    ruleName       = string
    startIpAddress = string
    endIpAddress   = string
  }))
  description = "Firewall rules"
}

variable "transaction_nodes" {
  type = list(object({
    node_template = any
  }))
  description = "Transaction nodes (One default transaction node is always created)."
  default     = []
}
