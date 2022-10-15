terraform {
  source = "../../..//project/"
}

generate "provider" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF

terraform {
  required_providers {
  	aws = {
  	  source  = "aws"
  	  version = "~> 4.32.0"
  	}
  }

  backend "local" {
  }
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Terraform   = "true"
      Global-environment = "global-training"
      Global-region      = "eu-west-1"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  alias  = "eu-west-2"

  default_tags {
    tags = {
      Terraform   = "true"
      Global-environment = "global-training"
      Global-region      = "eu-west-2"
    }
  }
}

EOF
}