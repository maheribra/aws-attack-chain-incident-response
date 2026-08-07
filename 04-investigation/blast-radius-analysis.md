# Blast Radius Analysis

## Purpose

This document analyzes the permissions and potential impact of the compromised IAM role used during the AWS Attack Chain and Incident Response laboratory.

## Compromised Role

Role Name:

aws-attack-chain-lab-vulnerable-role

ARN:

arn:aws:iam::<ACCOUNT_ID>:role/aws-attack-chain-lab-vulnerable-role

The role was successfully assumed by the attacker IAM user through AWS STS AssumeRole, which was confirmed through CloudTrail evidence.

## Trust Policy Analysis

The role trust relationship allowed any AWS principal to assume the role:

Principal:
*

Action:
sts:AssumeRole

Effect:
Allow

This represents a critical identity security weakness because the role was not restricted to a trusted AWS principal.

## IAM Policy Analysis

The role contained the following inline policy:

Policy Name:

aws-attack-chain-lab-vulnerable-policy

Permissions granted:

- s3:*
- iam:ListRoles
- iam:GetRole
- sts:GetCallerIdentity

All permissions were granted against:

Resource: *

## Impact Assessment

### Amazon S3

Severity: Critical

The role had unrestricted S3 permissions across all resources.

Potential impact:

- Read sensitive objects
- Modify stored data
- Delete objects
- Upload malicious content
- Alter S3 configurations

This permission represents the primary data exposure risk in the attack chain.

### IAM Enumeration

Severity: Medium

The role could enumerate IAM roles and retrieve role information.

Potential impact:

- Discover available roles
- Identify possible attack paths
- Gather information for further exploitation

### STS Identity Discovery

Severity: Low

The role could retrieve its own AWS identity information using sts:GetCallerIdentity.

Potential impact:

- Confirm compromised account context
- Validate assumed-role access

## Blast Radius Summary

The compromised role did not have full administrative privileges.

However, the excessive S3 permissions created a significant security impact because the attacker could access and modify AWS storage resources.

The attack demonstrated the risk of:

- Over-permissioned IAM roles
- Wildcard resource permissions
- Weak IAM trust policies

## Attack Path

Attacker IAM User

        |
        v

AssumeRole

        |
        v

aws-attack-chain-lab-vulnerable-role

        |
        +--> Full S3 Access
        |
        +--> IAM Role Enumeration
        |
        +--> STS Identity Discovery

## Conclusion

The compromised role provided enough permissions to achieve meaningful impact, particularly through unrestricted S3 access.

Although the role did not allow complete AWS account takeover, the excessive permissions significantly increased the potential damage from credential compromise.