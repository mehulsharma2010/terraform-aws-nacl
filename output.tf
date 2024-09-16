output "nacl_id" {
  description = "The ID of the Network ACL."
  value       = aws_network_acl.this.id
}
output "nacl_inbound_rules" {
  description = "The inbound rules for the Network ACL."
  value = {
    for rule in aws_network_acl_rule.inbound_rules : rule.rule_number => {
      protocol    = rule.protocol
      rule_action = rule.rule_action
      cidr_block  = rule.cidr_block
      from_port   = rule.from_port
      to_port     = rule.to_port
    }
  }
}
output "nacl_outbound_rules" {
  description = "The outbound rules for the Network ACL."
  value = {
    for rule in aws_network_acl_rule.outbound_rules : rule.rule_number => {
      protocol    = rule.protocol
      rule_action = rule.rule_action
      cidr_block  = rule.cidr_block
      from_port   = rule.from_port
      to_port     = rule.to_port
    }
  }
}
