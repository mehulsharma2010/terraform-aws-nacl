variable "vpc_id" {
  description = "The ID of the VPC where the NACL will be created"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the NACL association"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for the NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "egress_rules" {
  description = "List of egress rules for the NACL"
  type = list(object({
    protocol   = string
    rule_no    = number
    action     = string
    cidr_block = string
    from_port  = number
    to_port    = number
  }))
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}

