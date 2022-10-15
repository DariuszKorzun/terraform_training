resource "aws_subnet" "compute-private-a" {
  vpc_id                                        = aws_vpc.vpc-0.id
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = cidrsubnet(var.cidr_primary, 6, 1)
  availability_zone                              = "eu-west-1a"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "compute-private-a"
  }
}

resource "aws_subnet" "compute-public-a" {
  vpc_id                                         = aws_vpc.vpc-0.id
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = cidrsubnet(var.cidr_primary, 6, 0)
  availability_zone                              = "eu-west-1a"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "compute-public-a"
  }
}