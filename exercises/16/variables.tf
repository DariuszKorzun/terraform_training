variable "vpc-west-1_cidr" {
    type = string
    description = "VPC CIDR"    
    nullable = false
    sensitive = true
}

variable "vpc-west-1_name" {
    type = string
    description = "VPC Name"    
    nullable = false
    sensitive = false

    validation {
        condition     = length(var.vpc-west-1_name) > 4
        error_message = "Name too short"
    }
}

variable "aws_internet_gateway_igw-vpc-west-1_name" {
    type = string
    description = "IGW Name"
    nullable = false
    sensitive = false

    validation {
        condition     = length(var.aws_internet_gateway_igw-vpc-west-1_name) > 4
        error_message = "Name too short"
    }
}
