terraform {
  backend "s3" {
    bucket = "terraform-backend-nk"
    key    = "cicd-lambda/terraform.tfstate"
    region = "us-east-1"
  }
}

