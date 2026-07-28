variable "project_name" {
  description = "Name of the AWS Attack Chain lab"
  type        = string
  default     = "aws-attack-chain-lab"
}

variable "aws_region" {
  description = "AWS region for the lab"
  type        = string
  default     = "eu-west-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "security-lab"
}