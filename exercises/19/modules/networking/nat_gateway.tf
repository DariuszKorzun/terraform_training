resource "aws_nat_gateway" "nat-a" {
  allocation_id     = aws_eip.eip-nat-a.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.compute-public-a.id

  tags = {
    Name        = "Natgw-a"
  }

}