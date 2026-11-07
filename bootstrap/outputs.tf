output "state_bucket_name" {
  description = "S3 bucket holding Terraform state"
  value       = aws_s3_bucket.tfstate.bucket
}

output "lab_zone_id" {
  description = "Route53 hosted zone ID for the lab subdomain"
  value       = aws_route53_zone.lab.zone_id
}

output "lab_zone_name_servers" {
  description = "Name servers to delegate to from Cloudflare"
  value       = aws_route53_zone.lab.name_servers
}

output "github_plan_role_arn" {
  description = "Role GitHub Actions assumes for terraform plan on pull requests"
  value       = aws_iam_role.github_plan.arn
}

output "github_apply_role_arn" {
  description = "Role GitHub Actions assumes for terraform apply in the production environment"
  value       = aws_iam_role.github_apply.arn
}
