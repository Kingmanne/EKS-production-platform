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
