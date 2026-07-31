# Incident Findings Report

## Incident Overview

A simulated unauthorized S3 object access event was investigated using AWS CloudTrail Data Events.

The investigation confirmed that an identity using the OrganizationAccountAccessRole accessed a sensitive S3 object.

---

## Finding 1: Sensitive S3 Object Access

**Severity:** High

**Event:**
- API Action: GetObject
- Service: Amazon S3
- Event Category: Data

**Time:**
- 2026-07-31T10:48:28Z

**Identity:**
- arn:aws:sts::275023965626:assumed-role/OrganizationAccountAccessRole/botocore-session-1785494057

**Source IP:**
- 212.129.85.30

**Affected Resource:**
- s3://aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294/confidential/simulated-sensitive-data.txt

---

## Impact Assessment

The simulated attacker successfully retrieved sensitive data from an S3 object.

Potential impact:

- Confidential data exposure
- Unauthorized data access
- Credential or privilege misuse

---

## Detection Source

The activity was detected through:

- AWS CloudTrail Data Events
- S3 object-level API logging

---

## Investigation Status

Confirmed:
- Identity responsible for access
- Time of access
- Source IP address
- Target resource
- API operation performed

Next phase:
- Containment and remediation actions