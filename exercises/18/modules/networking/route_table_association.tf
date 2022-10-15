resource "aws_route_table_association" "rtb-association-private-a-compute-private-a" {
  route_table_id = aws_route_table.rtb-private-a.id
  subnet_id      = aws_subnet.compute-private-a.id
}

resource "aws_route_table_association" "rtb-association-public-compute-public-a" {
  route_table_id = aws_route_table.rtb-public.id
  subnet_id      = aws_subnet.compute-public-a.id
}