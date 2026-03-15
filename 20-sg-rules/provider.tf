terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }
  backend "s3" {

    bucket = "terraform-state-file-mani"
    key    = "roboshop-dev-sg-rules.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
    profile = "personal" 
    
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "personal" 
}