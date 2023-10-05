#terraform init
#terraform plan
#terraform apply

variable "region" {
  type = string
  default = "eu-west-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


# Create ALB 
module "alb" {
  source                       = "../modules/api-gateway"
  apigw_name                   = "tmnl_apigw"
}

module "lambda" {
  source                       = "../modules/lambda"
  name                         = "replace_words"
}

