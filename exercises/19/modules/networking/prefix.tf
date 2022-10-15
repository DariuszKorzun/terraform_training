resource "aws_ec2_managed_prefix_list" "compute-private-prfx" {
  name           = "compute-private-prfx"
  address_family = "IPv4"
  max_entries    = 12

  entry {
    description = "compute-private-a"
    cidr        = aws_subnet.compute-private-a.cidr_block
  }
  tags = {
    Name           = "compute-private-prfx"
  }
}

resource "aws_ec2_managed_prefix_list" "compute-public-prfx" {
  name           = "compute-public-prfx"
  address_family = "IPv4"
  max_entries    = 12

  entry {
    description = "compute-public-a"
    cidr        = aws_subnet.compute-public-a.cidr_block
  }

  tags = {
    Name           = "compute-public-prfx"
  }
}