resource "aws_vpc" "vpc-0" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = var.cidr_primary
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"

  tags = {
    Vpc-name                            = var.vpc_name
    Project-name                        = var.project_name
    Environment-name                    = var.env_name 
    Workspace                           = var.workspace
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "vpc-0-secondary-cidr" {
  vpc_id     = aws_vpc.vpc-0.id
  cidr_block = var.cidr_secondary
}