provider "aws" {
    region = "eu-central-1"
}


terraform {
    required_providers {
      required_version = ">= 2.7.0"
      source = "hashicorp/aws"
    }
    backend "s3" {}
}
 