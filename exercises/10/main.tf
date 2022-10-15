resource "aws_vpc" "vpc_west1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = "vpc_west1"
  }
}

resource "aws_s3_bucket" "terraform_s3_bucket" {
  bucket = "terraform-vpcwest1-s3-bucket"
}