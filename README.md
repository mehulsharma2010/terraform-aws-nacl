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
  region                  = "ap-south-1"
}

module "protected_subnet" {
  source = "./terraform-aws-vpc" # Adjust the path as needed

  vpc_id                       = var.vpc_id
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
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The sting name append in tags | `string` | `"opstree"` | yes |
| cidr_block | The CIDR block for the VPC. Default value is a valid CIDR  | `string` | `"10.0.0.0/24"` | no |
| instance_tenancy | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| enable_dns_support | A dns support for instances launched into the VPC | `boolean` | `"true"` | no |
| enable_dns_hostnames | A dns hostname for instances launched into the VPC | `boolean` | `"false"` | no |
| enable_classiclink |A dns classiclink for instances launched into the VPC | `boolean` | `"false"` | no |

Output
------
| Name | Description |
|------|-------------|
| vpc_id | The ID of the VPC |
| arn | The arn of the VPC |

## Related Projects

Check out these related projects.

- [security_group](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton) - Terraform module for creating dynamic Security 

### Contributors

|  [![Animesh Yadav][Animesh_avatar]][Animesh_homepage]<br/>[Animesh Sharma][Animesh_homepage] | 
|---|---|

  [Animesh_homepage]: https://github.com/animesh-opstree
  [Animesh_avatar]: https://ca.slack-edge.com/T2AGPFQ9X-U07CCA3T3NK-3415dfacd89f-512
  
