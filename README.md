🏗️ Multi-Workspace Terraform Architecture (AWS, EKS-Ready)
🎯 Architectural Goal
Design a Terraform architecture that:
Creates a single, shared, production-ready VPC
Uses Terraform workspaces to manage environments
Allows dev workspace to:
Create the VPC
Create an EC2 instance (CI/CD / Ansible / Jenkins)
In one terraform apply
Allows other workspaces (eks, platform, services) to:
Reuse the VPC
Never recreate networking
Scales cleanly for:
EKS
RDS
ALB / NLB
ArgoCD
Monitoring / Observability