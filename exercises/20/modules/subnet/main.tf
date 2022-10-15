resource "aws_subnet" "subnet" {
  # for_each   = { for subnet in var.subnet : subnet.cidr => subnet if lookup(data.aws_vpcs.vpcs, subnet.name, false) != "" ? true : false}
  for_each   = { for subnet in var.subnet : subnet.cidr => subnet if lookup(var.vpc, subnet.name, false) != false ? true : false}
  vpc_id     = lookup(var.vpc, each.value.name, "")
  cidr_block = each.key

  tags = {
    Name = "${each.value.name}-${each.key}"
  }
}

data "aws_vpcs" "vpcs" {
  filter {
    name   = "tag:Environment"
    values = ["training"]
  }
}