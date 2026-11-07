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

output "ecr_repository_urls" {
  description = "ECR repository URLs"
  value       = module.ecr.repository_urls
}

output "github_ecr_push_role_arn" {
  description = "Role GitHub Actions assumes to push images from main"
  value       = aws_iam_role.github_ecr_push.arn
}
