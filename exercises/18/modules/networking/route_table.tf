resource "aws_route_table" "rtb-public" {
  vpc_id = aws_vpc.vpc-0.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name        = "Public"

  }
}

resource "aws_route_table" "rtb-private-a" {
  vpc_id = aws_vpc.vpc-0.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-a.id
  }

  tags = {
    Name        = "Private-a"
  }
}