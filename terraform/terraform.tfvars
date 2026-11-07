cluster_name = "eks-platform"
vpc_cidr     = "10.0.0.0/16"
azs          = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

# Large private subnets: with the VPC CNI every pod gets a real VPC IP.
private_subnets = ["10.0.0.0/19", "10.0.32.0/19", "10.0.64.0/19"]
public_subnets  = ["10.0.96.0/24", "10.0.97.0/24", "10.0.98.0/24"]
