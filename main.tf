resource "aws_network_acl" "custom_nacl" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = var.name
    },
    var.tags,
  )
}

resource "aws_network_acl_rule" "inbound" {
  for_each = var.inbound_rules

  network_acl_id = aws_network_acl.custom_nacl.id
  rule_number    = each.value.rule_number
  egress         = false
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}

resource "aws_network_acl_rule" "outbound" {
  for_each = var.outbound_rules

  network_acl_id = aws_network_acl.custom_nacl.id
  rule_number    = each.value.rule_number
  egress         = true
  protocol       = each.value.protocol
  rule_action    = each.value.rule_action
  cidr_block     = each.value.cidr_block
  from_port      = each.value.from_port
  to_port        = each.value.to_port
}

resource "aws_subnet_network_acl_association" "custom_nacl" {
  for_each = toset(var.subnet_ids)

  subnet_id      = each.value
  network_acl_id = aws_network_acl.custom_nacl.id
}

