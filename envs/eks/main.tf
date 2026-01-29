provider "aws" {
  region = var.aws_region
}

data "aws_vpc" "existing" {
  filter {
    name   = "tag:Name"
    values = ["shared-vpc"]
  }
}

# This code shows all of the subnets (public and private) in the VPC


data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }
}



data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.existing.id]
  }

  filter {
    name   = "tag:Type"
    values = ["public"]
  }
}




module "eks" {
  source = "../../modules/eks"

  cluster_name = var.cluster_name
  vpc_id       = data.aws_vpc.existing.id
  subnet_ids   = data.aws_subnets.private.ids

  node_desired       = 2
  node_min           = 1
  node_max           = 3
  node_instance_type = "t3.medium"
}
