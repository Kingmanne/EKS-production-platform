variable "region" {
  description = "AWS region for the state bucket"
  type        = string
  default     = "eu-west-2"
}

variable "lab_zone_name" {
  description = "Route53 hosted zone delegated from Cloudflare for the EKS lab"
  type        = string
  default     = "lab.mustaphaseriki.dev"
}
