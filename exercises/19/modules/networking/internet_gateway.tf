resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.vpc-0.id

  tags = {
    Name = "Igw-vpc-0"
  }
}
