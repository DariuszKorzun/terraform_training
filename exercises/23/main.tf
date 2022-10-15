module "networking" {
    source              = "./modules/networking"
    cidr_primary        = var.cidr_primary
    cidr_secondary      = var.cidr_secondary
    vpc_name            = var.vpc_name
    workspace           = terraform.workspace
    project_name        = var.project_name
    env_name            = var.env_name
}