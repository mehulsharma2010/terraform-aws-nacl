output "custom_nacl_id" {
  description = "The ID of the custom Network ACL."
  value       = aws_network_acl.custom_nacl.id
}

output "custom_nacl_association" {
  description = "The NACL association for the subnet."
  value       = aws_network_acl_association.custom_nacl_association.id
}

