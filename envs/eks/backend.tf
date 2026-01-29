terraform {
  backend "s3" {
    bucket         = "my-terraform-states04"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
