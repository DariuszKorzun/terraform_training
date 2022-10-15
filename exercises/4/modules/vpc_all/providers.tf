terraform {
  required_providers {
    aws = {
      configuration_aliases = [ aws.region1, aws.region2 ]
    }
    azurerm = {
      configuration_aliases = [ azurerm.subscription ]
    }
  }
}