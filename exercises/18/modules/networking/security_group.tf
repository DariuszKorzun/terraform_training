resource "aws_security_group" "compute-private-sg" {
  vpc_id = aws_vpc.vpc-0.id
    name        = "Compute-private-sg"
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "TO: anywhere"
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "FROM: compute-private"
    from_port       = "0"
    prefix_list_ids = [aws_ec2_managed_prefix_list.compute-private-prfx.id]
    protocol        = "-1"
    self            = "false"
    to_port         = "0"
  }

  tags = {
    Name        = "Compute-private-sg"
  }
}

resource "aws_security_group" "compute-public-sg" {
  vpc_id = aws_vpc.vpc-0.id
    name        = "Compute-public-sg"
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "TO: anywhere"
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "FROM: anywhere"
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  tags = {
    Name        = "Compute-public-sg"
  }
}