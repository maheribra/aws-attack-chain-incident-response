output "aws_account_id" {
  description = "AWS account ID where the lab is deployed"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS region where the lab is deployed"
  value       = var.aws_region
}

output "project_name" {
  description = "Project name"
  value       = var.project_name
}

output "vulnerable_role_arn" {
  description = "ARN of the intentionally vulnerable IAM role"
  value       = aws_iam_role.vulnerable_role.arn
}

output "lab_attacker_arn" {
  description = "ARN of the low-privileged lab attacker identity"
  value       = aws_iam_user.lab_attacker.arn
}

output "sensitive_data_bucket_name" {
  description = "Name of the simulated sensitive data S3 bucket"
  value       = aws_s3_bucket.sensitive_data.id
}