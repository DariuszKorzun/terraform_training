terraform {
  required_providers {
    aws = {
      version ~> 4.21.0
    }
  }
}

provider "aws" {
  region = eu-west-1
}