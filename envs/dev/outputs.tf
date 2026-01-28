output "vpc_id" {
  description = "VPC ID created in dev environment"
  value       = module.vpc.vpc_id
}

output "ec2_public_ip" {
  description = "Public IP address of EC2 instance"
  value       = module.ci_ec2.public_ip
}
