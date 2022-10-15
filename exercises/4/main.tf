resource "aws_vpc" "vpc_west1" {
  cidr_block = "10.0.0.0/16"
  provider = aws.west1
}

resource "aws_vpc" "vpc_west2" {
  cidr_block = "10.1.0.0/16"
  provider = aws.west2
}

module "vpc_all" {
  source = "./modules/vpc_all"
  providers = {
    aws.region1 = aws.west1
    aws.region2 = aws.west2
    azurerm.subscription = azurerm.subs2
  }
}

# resource "azurerm_resource_group" "res_west_europe" {
#   name = "rg_west_europe"
#   location = "West Europe"
# }

# resource "azurerm_resource_group" "res_north_europe" {
#   name = "rg_north_europe"
#   location = "North Europe"
#   provider = azurerm.subs2
# }
