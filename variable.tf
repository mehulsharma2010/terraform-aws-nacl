variable "enable_protected_subnet" {
  description = "Flag to determine if protected subnets should be created"
  type        = bool
  default     = false
}


variable "vpc_id" {}

variable "tags" {
  description = "A map of tags to be added to subnets"
  type        = map(string)
  default     = {}
}

variable "nacl_inbound_rules" {
  type = map(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    from_port   = optional(number)
    to_port     = optional(number)
  }))
}

variable "nacl_outbound_rules" {
  type = map(object({
    rule_number = number
    protocol    = string
    action      = string
    cidr_block  = string
    from_port   = optional(number)
    to_port     = optional(number)
  }))
}


variable "nacl_name" {
  type = string
}


variable "subnet_ids" {
  description = "List of subnet IDs to associate with the NACL"
  type        = list(string)
}
