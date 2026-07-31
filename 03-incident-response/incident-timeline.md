# Incident Timeline

## Summary

This document reconstructs the simulated attack using CloudTrail evidence.

---

## Timeline

### 2026-07-31 10:48:28 UTC

**Event**
- GetObject

**Actor**
- arn:aws:sts::275023965626:assumed-role/OrganizationAccountAccessRole/botocore-session-1785494057

**Source IP**
- 212.129.85.30

**Target Resource**
- Bucket:
  aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294

- Object:
  confidential/simulated-sensitive-data.txt

**Evidence**
- CloudTrail Data Event
- Event Category: Data
- ReadOnly: True

---

## Assessment

The attacker successfully accessed a sensitive object stored in S3.

CloudTrail Data Events recorded the object access, allowing investigators to identify:

- exact time
- attacker identity
- source IP
- affected resource
- API action performed

This event serves as the primary forensic evidence for the simulated attack.