terraform {
  required_providers {
    aws = {
      version = "~> 4.21.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  alias = "west1"
}

provider "aws" {
  region = "eu-west-2"
  alias = "west2"
}