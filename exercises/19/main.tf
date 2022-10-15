module "networking" {
    source = "./modules/networking"
    cidr_primary = var.cidr_primary
    cidr_secondary = var.cidr_secondary
    vpc_name = var.vpc_name
    s3-endpoint = var.s3-endpoint
}