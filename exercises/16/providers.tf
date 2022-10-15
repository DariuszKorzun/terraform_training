terraform {
  required_providers {
    aws = {
      version = "~> 4.32.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "training"
      Region      = "eu-west-1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  alias  = "eu-west-2"

  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "training"
      Region      = "eu-west-2"
    }
  }
}