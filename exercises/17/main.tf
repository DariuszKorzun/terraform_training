locals {
  customer = "Teraform"
  vpc_cidr = [
      {
        cidr    = "10.0.0.0/16"
        name    = "vpc-1"
      },
      {
        cidr    = "10.1.0.0/16"
        name    = "vpc-2"
      }
    ]

  vpc_cidr2 = [
      {
        cidr    = "10.2.0.0/16"
        name    = "vpc-3"
      },
      {
        cidr    = "10.3.0.0/16"
        name    = "vpc-4"
      }
    ]
}

resource "aws_vpc" "vpc1" {
  # Iteration with count
  count           = length(local.vpc_cidr)
  cidr_block       = local.vpc_cidr[count.index]["cidr"]
  tags = {
    Name = "${local.customer}-${local.vpc_cidr[count.index]["name"]}"
  }
}

resource "aws_vpc" "vpc2" {
  # Iteration with for each
  for_each = { for vpc in local.vpc_cidr2 : vpc.cidr => vpc }
  cidr_block       = each.key
  tags = {
    Name = "${local.customer}-${each.value.name}"
  }
}

output "vpc_cird" {
  value = local.vpc_cidr
}

output "vpc_cidr2" {
  value = local.vpc_cidr2
}