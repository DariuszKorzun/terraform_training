locals {
  # Automatically load environment-level variables
  project_vars                        = read_terragrunt_config(find_in_parent_folders("project_env.hcl"))  
}

include "root" {
  path = find_in_parent_folders()
}

include "vpc" {
  path           = "../config/vpc.hcl"
  expose         = true
  merge_strategy = "deep"

}

inputs = {
  cidr_primary    = "30.0.0.0/16"
  cidr_secondary  = "40.0.0.0/16"
  vpc_name        = local.project_vars.inputs.vpc_name["dev"]
}