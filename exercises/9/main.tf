resource "aws_vpc" "vpc_west1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = "vpc_west1"
  }
}
