variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the control plane"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the control plane ENIs and worker nodes"
  type        = list(string)
}

variable "public_access_cidrs" {
  description = "CIDRs allowed to reach the public Kubernetes API endpoint"
  type        = list(string)
}

variable "admin_principal_arns" {
  description = "IAM users/roles granted cluster-admin through EKS access entries"
  type        = list(string)
}

variable "node_instance_types" {
  description = "EC2 instance types for the managed node group"
  type        = list(string)
}

variable "node_ami_type" {
  description = "AMI type for the nodes (must match instance CPU architecture)"
  type        = string
}

variable "node_capacity_type" {
  description = "ON_DEMAND or SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

variable "log_retention_days" {
  description = "Retention for the control plane log group"
  type        = number
  default     = 3
}
