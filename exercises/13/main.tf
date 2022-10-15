resource "aws_vpc" "vpc-west-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-west-1"
  }
}

resource "aws_internet_gateway" "igw-vpc-west-1" {
  vpc_id = aws_vpc.vpc-west-1.id
  tags = {
    Name = "igw-vpc-west-1"
  }
}

resource "aws_vpc" "vpc-west-2" {
  provider = aws.eu-west-2
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "vpc-west-2"
  }
}

resource "aws_internet_gateway" "igw-vpc-west-2" {
  provider = aws.eu-west-2
  tags = {
    Name = "igw-vpc-west-2"
  }
}

resource "aws_internet_gateway_attachment" "igw-vpc-west-2" {
  provider = aws.eu-west-2
  vpc_id = aws_vpc.vpc-west-2.id
  internet_gateway_id = aws_internet_gateway.igw-vpc-west-2.id
}