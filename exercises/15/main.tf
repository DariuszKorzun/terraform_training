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

resource "aws_internet_gateway_attachment" "igw-vpc-west-1" {
  vpc_id = aws_vpc.vpc-west-1.id
  internet_gateway_id = aws_internet_gateway.igw-vpc-west-1.id
}

output "igw-vpc-west-1_arn" {
  description = "Internet gateway arn"
  value = aws_internet_gateway.igw-vpc-west-1.arn
  sensitive = true

  depends_on = [
    aws_internet_gateway.igw-vpc-west-1
  ]
}

output "igw-vpc-west-1_arn_id" {
  description = "Internet gateway arn/id"
  
  value = "ARN: ${aws_internet_gateway.igw-vpc-west-1.arn}, ID: ${aws_internet_gateway.igw-vpc-west-1.id}"
  sensitive = false

  depends_on = [
    aws_internet_gateway.igw-vpc-west-1
  ]
}

output "igw-vpc-west-1" {
  description = "All internet gateway attributes"
  value = aws_internet_gateway.igw-vpc-west-1
  sensitive = false

  depends_on = [
    aws_internet_gateway.igw-vpc-west-1
  ]
}