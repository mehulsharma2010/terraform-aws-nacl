output "nacl_id" {
  description = "The ID of the created Network ACL"
  value       = aws_network_acl.custom_nacl.id
}

output "nacl_association_id" {
  description = "The ID of the Network ACL association"
  value       = aws_network_acl_association.custom_nacl_assc.id
}

