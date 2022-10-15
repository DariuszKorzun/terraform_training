resource "aws_vpc" "vpc-west-1" {
  cidr_block = var.vpc-west-1_cidr
  tags = {
    Name = var.vpc-west-1_name
  }
}

resource "aws_internet_gateway" "igw-vpc-west-1" {
  tags = {
    Name = var.aws_internet_gateway_igw-vpc-west-1_name
  }
}

resource "aws_internet_gateway_attachment" "igw-vpc-west-1" {
  vpc_id = aws_vpc.vpc-west-1.id
  internet_gateway_id = aws_internet_gateway.igw-vpc-west-1.id
}

output "igw-vpc-west-1" {
  description = "All internet gateway attributes"
  value = aws_internet_gateway.igw-vpc-west-1
  sensitive = false

  depends_on = [
    aws_internet_gateway.igw-vpc-west-1
  ]
}