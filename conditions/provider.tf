terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
}

#just provides authentication to aws

provider "aws" {
  # Configuration options
  region = "us-east-1"
}