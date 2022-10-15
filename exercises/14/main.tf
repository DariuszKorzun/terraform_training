resource "aws_vpc" "vpc-west-1" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-west-1"
  }
}

resource "aws_internet_gateway" "igw-vpc-west-1" {
  tags = {
    Name = "igw-vpc-west-1"
  }
}

data "aws_vpc" "vpc-west-1" {
  filter {
    name   = "tag:Environment"
    values = ["training"]
  }

  tags = {
    Name = "vpc-west-1"
  }

  depends_on = [
    aws_vpc.vpc-west-1
  ]
}

data "aws_internet_gateway" "igw-vpc-west-1" {
  filter {
    name   = "tag:Environment"
    values = ["training"]
  }

  tags = {
    Name = "igw-vpc-west-1"
  }

  depends_on = [
    aws_internet_gateway.igw-vpc-west-1
  ]
}

resource "aws_internet_gateway_attachment" "igw-vpc-west-1" {
  vpc_id = data.aws_vpc.vpc-west-1.id
  internet_gateway_id = data.aws_internet_gateway.igw-vpc-west-1.id
}

# resource "null_resource" "previous_step" {}

# resource "time_sleep" "wait_10_seconds" {
#   depends_on = [null_resource.previous_step]

#   create_duration = "10s"
# }

# resource "null_resource" "next_step" {
#   depends_on = [time_sleep.wait_10_seconds]
# }

data "aws_internet_gateway" "igw" {
  filter {
    name = "attachment.vpc-id"
    values = [data.aws_vpc.vpc-west-1.id]
  }

  depends_on = [
    aws_internet_gateway_attachment.igw-vpc-west-1
  ]
}

output "igw-vpc-west-1" {
  value = data.aws_internet_gateway.igw

  depends_on = [
    aws_internet_gateway.igw-vpc-west-1
  ]
}