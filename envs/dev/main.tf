# Dev workspace root module
# VPC and EC2 will be added in next steps


module "vpc" {
  source = "../../modules/vpc"

  name            = "shared-vpc"
  cidr            = "10.0.0.0/16"
  azs             = ["ap-south-1a", "ap-south-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.4.0/24"]
}

module "ci_ec2" {
  source = "../../modules/ec2"

  name          = "dev-ci-server"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_ids[0]
  vpc_id        = module.vpc.vpc_id
  key_name      = var.key_name
}
