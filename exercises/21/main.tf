module "networking" {
    source = "./modules/networking"
    cidr_primary = var.cidr_primary
    cidr_secondary = var.cidr_secondary
    vpc_name = "${terraform.workspace}-${var.vpc_name}"
}