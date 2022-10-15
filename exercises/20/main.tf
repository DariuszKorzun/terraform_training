module "vpc" {
  source = "./modules/vpc"
  vpc    = var.vpc
}

module "subnet" {
  source = "git::https://github.com/DariuszKorzun/terraform_training.git//exercises/20/modules/subnet"
  # source = "./modules/subnet"
  vpc    = module.vpc.vpc_id
  subnet = var.subnet

  depends_on = [
    module.vpc
  ]
}