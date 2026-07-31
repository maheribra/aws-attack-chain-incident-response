# Privilege Escalation Path

## Initial Access

The attack simulation begins with the low-privileged IAM user:

`aws-attack-chain-lab-attacker`

The attacker is able to assume the following IAM role:

`aws-attack-chain-lab-vulnerable-role`

## Trust Relationship

The role's trust relationship permits the attacker principal to assume the role.

This was verified successfully using AWS STS `AssumeRole`.

## Privilege Escalation

After assuming the vulnerable role, the attacker gains the following permissions:

- `s3:*`
- `iam:ListRoles`
- `iam:GetRole`
- `sts:GetCallerIdentity`

The role policy applies to:

`Resource: *`

## Current Attack Path

Low-privileged IAM user
        ↓
AssumeRole
        ↓
aws-attack-chain-lab-vulnerable-role
        ↓
Full S3 access (`s3:*`)
        ↓
Potential access to sensitive S3 data

## Verification Status

- [x] Attacker can assume vulnerable role
- [x] Vulnerable role identified
- [x] Inline policy enumerated
- [x] Full S3 permissions confirmed
- [x] Sensitive data access demonstrated
- [x] CloudTrail evidence captured
- [x] CloudTrail forensic evidence validated
- [x] GuardDuty and Security Hub detection gap documented
- [ ] Remediation completed