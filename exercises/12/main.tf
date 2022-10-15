locals {
  vpc = {
    "${aws_vpc.vpc_west1.tags.Name}" = aws_vpc.vpc_west1.id
    "${aws_vpc.vpc_west2.tags.Name}" = aws_vpc.vpc_west2.id 
  }
}

resource "aws_vpc" "vpc_west1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc_west1"
    #Test_tag = "Test_tag"
  }
}

resource "aws_vpc" "vpc_west2" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "vpc_west2"
  }

  provider = aws.eu-west-2
}

output "vpc_name" {
  value = local.vpc
}