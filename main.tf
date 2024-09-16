resource "aws_network_acl" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    var.tags,
    {
      "Name" = format("%s-Nacl", var.nacl_name)
    }
  )
}

# Inbound rules for the NACL
resource "aws_network_acl_rule" "inbound_rules" {
  for_each       = var.nacl_inbound_rules
  network_acl_id = aws_network_acl.this.id
  rule_number    = each.value.rule_number
  egress         = false
  protocol       = each.value.protocol
  rule_action    = each.value.action
  cidr_block     = each.value.cidr_block

  from_port = each.value.protocol != "-1" ? lookup(each.value, "from_port", null) : null
  to_port   = each.value.protocol != "-1" ? lookup(each.value, "to_port", null) : null
}

# Outbound rules for the NACL
resource "aws_network_acl_rule" "outbound_rules" {
  for_each       = var.nacl_outbound_rules
  network_acl_id = aws_network_acl.this.id
  rule_number    = each.value.rule_number
  egress         = true
  protocol       = each.value.protocol
  rule_action    = each.value.action
  cidr_block     = each.value.cidr_block

  from_port = lookup(each.value, "from_port", null)
  to_port   = lookup(each.value, "to_port", null)
}

# Associate NACL with each subnet ID
resource "aws_network_acl_association" "this" {
  count          = length(var.subnet_ids)
  network_acl_id = aws_network_acl.this.id
  subnet_id      = element(var.subnet_ids, count.index)
}
