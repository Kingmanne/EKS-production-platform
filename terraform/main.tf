module "vpc" {
  source = "./modules/vpc"

  name            = var.cluster_name
  cidr            = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  cluster_name    = var.cluster_name
}

module "eks" {
  source = "./modules/eks"

  cluster_name         = var.cluster_name
  cluster_version      = var.cluster_version
  subnet_ids           = module.vpc.private_subnet_ids
  public_access_cidrs  = var.public_access_cidrs
  admin_principal_arns = var.admin_principal_arns
  node_instance_types  = var.node_instance_types
  node_ami_type        = var.node_ami_type
}

module "ecr" {
  source = "./modules/ecr"

  repository_names = var.ecr_repositories
}
