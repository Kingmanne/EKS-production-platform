output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = [for az in var.azs : aws_subnet.public[az].id]
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = [for az in var.azs : aws_subnet.private[az].id]
}

output "nat_public_ip" {
  description = "Public IP the private subnets use for outbound traffic"
  value       = aws_eip.nat.public_ip
}
