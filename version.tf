terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  backend "s3" {
      bucket = "devops-s3573"
      key    = "backend/statefile"
      region = "eu-west-2"
  }
}

 