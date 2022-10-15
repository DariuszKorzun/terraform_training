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
  alias = "west1"
}

provider "aws" {
  region = "eu-west-2"
  alias = "west2"
}

provider "azurerm" {
  subscription_id = "11a82ecc-d5ba-473d-abe2-4b86557c9d55"
  features {}
}

provider "azurerm" {
  subscription_id = "11a82ecc-d5ba-473d-abe2-4b86557c9d55"
  alias = "subs2"
  features {}
}