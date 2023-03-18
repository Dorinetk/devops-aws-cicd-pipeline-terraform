terraform {
  backend "s3" {
    bucket = "terraform-backend-2023"
    key    = "cicd-lambda/terraform.tfstate"
    region = "us-east-1"
  }
}

