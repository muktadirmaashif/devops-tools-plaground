terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  
  # STATE MANAGEMENT: Remote State (S3 + DynamoDB for locking)
  # Replace bucket/key/region with your actual playground resources
  backend "s3" {
    bucket = "tf-remote-state-bucket-253882248345"
    key = "terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }

}

provider "aws" {
  region  = "us-east-1"
}
