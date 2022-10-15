resource "aws_eip" "eip-nat-a" {
  vpc = "true"
  public_ipv4_pool     = "amazon"

  tags = {
    Name        = "Eip-nat-a"
  }
}