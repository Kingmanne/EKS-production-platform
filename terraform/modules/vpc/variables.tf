variable "name" {
  description = "Name prefix for all VPC resources"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "Availability zones to spread subnets across"
  type        = list(string)

  validation {
    condition     = length(var.azs) >= 2
    error_message = "EKS needs subnets in at least two availability zones."
  }
}

variable "public_subnets" {
  description = "One public subnet CIDR per AZ (same order as azs)"
  type        = list(string)
}

variable "private_subnets" {
  description = "One private subnet CIDR per AZ (same order as azs)"
  type        = list(string)
}

variable "cluster_name" {
  description = "EKS cluster name, used for subnet discovery tags"
  type        = string
}
