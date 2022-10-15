terraform {
  required_providers {
    aws = {
      version = "~> 4.21.0"
    }
    azurerm = {
      version = "~> 3.14.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "azurerm" {
  subscription_id = "11a82ecc-d5ba-473d-abe2-4b86557c9d55"
  features {}
}