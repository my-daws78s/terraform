terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
}

#for terraform to run we need aws cli authentication here, aws configure was already done on my machine during earlier IAM session so it passed thru.
provider "aws" {
  # Configuration options
  region = "us-east-1"
}