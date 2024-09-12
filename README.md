AWS Network Skeleton Terraform module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates network skeleton on AWS.

These types of resources are supported:

* [VPC](https://www.terraform.io/docs/providers/aws/r/vpc.html)

Terraform versions
------------------

Terraform 0.12.

Usage
------

```hcl
provider "aws" {
  region                  = "ap-northeast-1"
}

module "protected_subnet" {
  source = "./terraform-aws-vpc" # Adjust the path as needed

  vpc_id                       = var.vpc_id
  count                        = var.enable_protected_subnet == true ? 1 : 0
  protected_subnets_cidr       = var.protected_subnets_cidr
  availability_zones           = var.availability_zones
  protected_subnet_name        = var.protected_subnet_name
  protected_rt_name            = var.protected_rt_name
  protected_nacl_inbound_rules = var.protected_nacl_inbound_rules
  protected_nacl_outbound_rules = var.protected_nacl_outbound_rules
  tags                         = var.tags
}


```

```
terraform.tfvars

vpc_id = "vpc-03e187317b8827866"

protected_subnets_cidr = [
  "10.0.10.0/24",
  "10.0.20.0/24"
]

availability_zones = [
  "ap-northeast-1a",
  "ap-northeast-1c"
]

protected_subnet_name = "protected-subnet"

protected_rt_name = "protected-rt"

protected_nacl_inbound_rules = [
  {
    rule_number = 100
    protocol    = "tcp"
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 80
    to_port     = 80
  },
  {
    rule_number = 101
    protocol    = "tcp"
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 443
    to_port     = 443
  }
]

protected_nacl_outbound_rules = [
  {
    rule_number = 100
    protocol    = "tcp"
    action      = "allow"
    cidr_block  = "0.0.0.0/0"
    from_port   = 0
    to_port     = 65535
  }
]

tags = {
  Environment = "Production"
  Project     = "MyProject"
}

```
Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.

Inputs
------
| Name                         | Description                                               | Type                                                                                               | Default                                    | Required |
|------------------------------|-----------------------------------------------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------|:--------:|
| `vpc_id`                      | The ID of the VPC where the subnets will be created.       | `string`                                                                                           | n/a                                        |   yes    |
| `protected_subnets_cidr`      | The list of CIDR blocks for the protected subnets.         | `list(string)`                                                                                     | n/a                                        |   yes    |
| `availability_zones`          | The list of availability zones for the protected subnets.  | `list(string)`                                                                                     | n/a                                        |   yes    |
| `protected_subnet_name`       | The name for the protected subnets.                        | `string`                                                                                           | `"protected-subnet"`                       |    yes   |
| `protected_rt_name`           | The name for the route table associated with the protected subnets. | `string`                                                                                           | `"protected-rt"`                           |    yes   |
| `protected_nacl_inbound_rules`| The inbound rules for the network ACL.                     | `list(object({ rule_number = number, protocol = string, action = string, cidr_block = string, from_port = optional(number), to_port = optional(number) }))` | n/a |   yes    |
| `protected_nacl_outbound_rules`| The outbound rules for the network ACL.                   | `list(object({ rule_number = number, protocol = string, action = string, cidr_block = string, from_port = optional(number), to_port = optional(number) }))` | n/a |   yes    |
| `tags`                        | Additional tags to assign to resources.                   | `map(string)`                                                                                      | `{Environment = "Production", Project = "MyProject"}` |    no    |



## Related Projects

Check out these related projects.

- [security_group](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton) - Terraform module for creating dynamic Security 

### Contributors

  [![Animesh Yadav][Animesh_avatar]][Animesh_homepage]<br/>[Animesh Yadav][Animesh_homepage] 


  [Animesh_homepage]: https://github.com/animesh-opstree
  [Animesh_avatar]: https://ca.slack-edge.com/T2AGPFQ9X-U07CCA3T3NK-3415dfacd89f-192
  
