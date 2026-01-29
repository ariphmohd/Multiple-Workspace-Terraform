output "vpc_id" {
  value = data.aws_vpc.existing.id
}

output "private_subnet_ids" {
  value = data.aws_subnets.private.ids
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}
