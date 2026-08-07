# CloudTrail Investigation Evidence

This directory contains exported AWS CloudTrail log evidence collected during the authorized AWS Attack Chain & Incident Response laboratory exercise.

## Purpose

The logs were used to investigate:

- IAM role assumption activity
- STS temporary credential usage
- S3 object access
- Unauthorized resource access attempts
- Attack timeline reconstruction

## Evidence Scope

Environment:
- AWS Region: eu-west-1
- Date: 2026-07-28
- Source: AWS CloudTrail

## Investigation Flow

The evidence was analyzed to identify:

1. Initial identity activity
2. IAM privilege escalation attempts
3. Role assumption events
4. S3 data access events
5. Attacker activity timeline

## Data Classification

All evidence originates from an intentionally vulnerable AWS security laboratory environment.

No production data, customer data, credentials, or real secrets are included.