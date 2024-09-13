variable "vpc_id" {
  description = "The ID of the VPC where the NACL will be created."
  type        = string
}

variable "nacl_name" {
  description = "Name for the custom NACL."
  type        = string
  default     = "custom-nacl"
}

variable "custom_nacl_ingress" {
  description = "A list of ingress (inbound) rules for the NACL."
  type = list(object({
    rule_no    = number
    protocol   = string
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "custom_nacl_egress" {
  description = "A list of egress (outbound) rules for the NACL."
  type = list(object({
    rule_no    = number
    protocol   = string
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the NACL."
  type        = string
}

variable "tags" {
  description = "Tags to assign to the NACL."
  type        = map(string)
  default     = {}
}

