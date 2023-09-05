terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.18.0"
    }
  }
  backend "s3" {
    key            = "infra/terraform.tfstate"
    bucket         = "muvi-terraform-state-backend"
    dynamodb_table = "muvi-state-table"
    region         = "us-east-1"
  }
}