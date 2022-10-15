resource "aws_vpc" "vpc-0" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "10.0.0.0/16"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"

  tags = {
    Name                            = "vpc-0"
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "vpc-0-secondary-cidr" {
  vpc_id     = aws_vpc.vpc-0.id
  cidr_block = "20.0.0.0/16"
}