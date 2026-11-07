variable "region" {
  description = "AWS region for the platform"
  type        = string
  default     = "eu-west-2"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones to use"
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDRs, one per AZ"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs, one per AZ"
  type        = list(string)
}

variable "cluster_version" {
  description = "Kubernetes version for EKS"
  type        = string
}

variable "public_access_cidrs" {
  description = "CIDRs allowed to reach the EKS public API endpoint"
  type        = list(string)
}

variable "admin_principal_arns" {
  description = "IAM principals with cluster-admin access"
  type        = list(string)
}

variable "node_instance_types" {
  description = "Instance types for worker nodes"
  type        = list(string)
}

variable "node_ami_type" {
  description = "AMI type for worker nodes"
  type        = string
}

variable "ecr_repositories" {
  description = "ECR repositories to create"
  type        = list(string)
}
