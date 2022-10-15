resource "aws_network_acl" "private-acl" {
  vpc_id = aws_vpc.vpc-0.id
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "10000"
    to_port    = "0"
  }

  egress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = "23"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "6"
    rule_no    = "300"
    to_port    = "23"
  }

  egress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = "22"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "6"
    rule_no    = "200"
    to_port    = "22"
  }

  egress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = "445"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "6"
    rule_no    = "400"
    to_port    = "445"
  }

  ingress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = "445"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "6"
    rule_no    = "400"
    to_port    = "445"
  }

  ingress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = "22"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "6"
    rule_no    = "200"
    to_port    = "22"
  }

  ingress {
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = "23"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "6"
    rule_no    = "300"
    to_port    = "23"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "10000"
    to_port    = "0"
  }

  subnet_ids = [aws_subnet.compute-private-a.id]

  tags = {
    Name        = "Default-acl-private"
  }
}

resource "aws_network_acl" "public-acl" {
  vpc_id = aws_vpc.vpc-0.id

  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "10000"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "10000"
    to_port    = "0"
  }

  subnet_ids = [aws_subnet.compute-public-a.id]

  tags = {
    Name        = "Default-acl-public"
  }
}