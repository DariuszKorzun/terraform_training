resource "aws_vpc" "vpc" {
  for_each   = { for vpc in var.vpc : vpc.name => vpc }
  cidr_block = each.value.cidr
  tags = {
    Name = "${each.key}-${each.value.cidr}"
  }
}