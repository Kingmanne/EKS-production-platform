cluster_name = "eks-platform"
vpc_cidr     = "10.0.0.0/16"
azs          = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

# Large private subnets: with the VPC CNI every pod gets a real VPC IP.
private_subnets = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
public_subnets  = ["10.0.96.0/24", "10.0.97.0/24", "10.0.98.0/24"]

cluster_version     = "1.37"
public_access_cidrs = ["5.151.134.166/32"]
admin_principal_arns = [
  "arn:aws:iam::371510064293:user/GoldenMango",
  "arn:aws:iam::371510064293:role/github-actions-terraform-apply",
]

# Graviton (ARM) nodes: match the arm64 images built on Apple Silicon, ~20% cheaper than t3
node_instance_types = ["t4g.medium"]
node_ami_type       = "AL2023_ARM_64_STANDARD"

