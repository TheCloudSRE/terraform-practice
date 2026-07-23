
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<6.56.0"
      #version= ">6.52.0"
      #version = ">6.50.0,<6.56.0"
    }
  }
}

terraform {
  required_version = ">1.5.0"   # terraform version
}

provider "aws" {
  region = "ap-south-1"  #if required
}