data "aws_caller_identity" "current" {}

locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Purpose     = "Authorized Security Lab"
  }
}

resource "aws_s3_bucket" "sensitive_data" {
  bucket_prefix = "${var.project_name}-sensitive-"

  tags = merge(local.common_tags, {
    Name = "Sensitive Data Bucket"
  })
}

resource "aws_s3_object" "sensitive_data" {
  bucket       = aws_s3_bucket.sensitive_data.id
  key          = "confidential/simulated-sensitive-data.txt"
  source       = "${path.module}/sensitive-data.txt"
  content_type = "text/plain"
}

resource "aws_s3_bucket_public_access_block" "sensitive_data" {
  bucket = aws_s3_bucket.sensitive_data.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_iam_role" "vulnerable_role" {
  name = "${var.project_name}-vulnerable-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = merge(local.common_tags, {
    Name = "Vulnerable Privilege Escalation Role"
  })
}

resource "aws_iam_role_policy" "vulnerable_role_policy" {
  name = "${var.project_name}-vulnerable-policy"
  role = aws_iam_role.vulnerable_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:*",
          "iam:ListRoles",
          "iam:GetRole",
          "sts:GetCallerIdentity"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user" "lab_attacker" {
  name = "${var.project_name}-attacker"

  tags = merge(local.common_tags, {
    Name = "Low Privileged Lab Attacker"
  })
}

resource "aws_iam_user_policy" "lab_attacker_policy" {
  name = "${var.project_name}-attacker-policy"
  user = aws_iam_user.lab_attacker.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sts:GetCallerIdentity",
          "iam:ListRoles",
          "iam:GetRole"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy" "lab_attacker_assume_role" {
  name = "${var.project_name}-attacker-assume-role"
  user = aws_iam_user.lab_attacker.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:AssumeRole"
        Resource = aws_iam_role.vulnerable_role.arn
      }
    ]
  })
}