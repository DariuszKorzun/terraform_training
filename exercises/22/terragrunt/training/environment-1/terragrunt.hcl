locals {
  # Automatically load environment-level variables
  environment_vars                    = read_terragrunt_config("env.hcl")
  project_vars                        = read_terragrunt_config(find_in_parent_folders("project_env.hcl"))

  # Extract out common variables for reuse
  project_name        = local.project_vars.inputs.project_name
  env_name            = local.environment_vars.inputs.env_name
}

include "root" {
  path = find_in_parent_folders()
}

inputs = {
  cidr_primary    = "10.0.0.0/16"
  cidr_secondary  = "20.0.0.0/16"
  vpc_name        = "vpc-0"
  project_name    = local.project_name
  env_name        = local.env_name
}