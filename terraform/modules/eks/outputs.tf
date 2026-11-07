output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Kubernetes API endpoint"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_security_group_id" {
  description = "Security group EKS created for the control plane and nodes"
  value       = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "oidc_provider_arn" {
  description = "IAM OIDC provider ARN, for IRSA roles"
  value       = aws_iam_openid_connect_provider.eks.arn
}

output "oidc_issuer_url" {
  description = "OIDC issuer URL of the cluster"
  value       = aws_eks_cluster.this.identity[0].oidc[0].issuer
}

output "node_role_arn" {
  description = "IAM role used by the worker nodes"
  value       = aws_iam_role.node.arn
}
