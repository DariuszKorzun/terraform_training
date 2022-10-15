resource "aws_vpc" "vpc_west1" {
  cidr_block = "10.0.0.0/16"
  provider = aws.west1
  
  tags = {
    name = "${random_string.random.result}-west1"
  }
}

resource "aws_vpc" "vpc_west2" {
  cidr_block = "10.1.0.0/16"
  provider = aws.west2
  tags = {
    name = "${random_string.random.result}-west2"
  }
}

resource "random_string" "random" {
  length           = 16
  special          = false
}

output "random" {
  value = random_string.random.result
}

resource "local_file" "local_file" {
    content  = "${aws_vpc.vpc_west1.tags.name}: ${aws_vpc.vpc_west1.cidr_block}\n${aws_vpc.vpc_west2.tags.name}: ${aws_vpc.vpc_west2.cidr_block}"
    filename = "${path.module}/local_file.txt"
}

output "local_file" {
  value = local_file.local_file.content
}
