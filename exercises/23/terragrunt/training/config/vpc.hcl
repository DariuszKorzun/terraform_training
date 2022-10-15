locals {
    # Automatically load environment-level variables
    environment_vars                    = read_terragrunt_config("env.hcl")
    project_vars                        = read_terragrunt_config(find_in_parent_folders("project_env.hcl"))
}

inputs = {
    project_name    = local.project_vars.inputs.project_name
    env_name        = local.environment_vars.inputs.env_name
}