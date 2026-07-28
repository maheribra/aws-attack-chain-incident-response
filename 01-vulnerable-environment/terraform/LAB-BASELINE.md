# AWS Attack Chain Lab - Baseline

## Purpose

This document records the initial security baseline of the deliberately vulnerable AWS environment before the authorized attack simulation.

## Environment

- AWS Account: 275023965626
- Region: eu-west-1
- Infrastructure: Terraform
- Purpose: Authorized security incident-response laboratory

## Deliberately Vulnerable Components

1. Publicly assumable IAM role
2. Over-permissioned IAM role with broad S3 permissions
3. Vulnerable S3 bucket containing simulated sensitive data
4. CloudTrail logging enabled for forensic investigation
5. GuardDuty and Security Hub configured for detection

## IAM Vulnerability

The role `aws-attack-chain-lab-vulnerable-role` was intentionally configured with broad permissions including `s3:*`. Its trust policy allowed the lab attacker identity to assume the role.

## S3 Vulnerability

The vulnerable S3 bucket contained a simulated confidential file. The file contained no real credentials, secrets, personal data, or production information.

## Expected Attack Path

Attacker IAM User
-> AssumeRole
-> Vulnerable IAM Role
-> Temporary STS Credentials
-> S3 Access
-> Simulated Sensitive Data Retrieval

## Security Objective

The objective was to demonstrate how excessive IAM permissions and weak role trust configuration can enable an attacker to obtain temporary credentials and access sensitive resources.

## Post-Incident Objective

After the attack simulation, the incident was investigated using CloudTrail evidence, contained through session revocation, remediated, and validated using post-revocation access testing and security scanning.
