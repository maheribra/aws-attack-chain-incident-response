# AWS Attack Chain & Incident Response

## Overview

A hands-on AWS security laboratory demonstrating a complete attack-to-response lifecycle. A deliberately vulnerable AWS environment was deployed with Terraform, attacked through an authorized simulation, investigated using CloudTrail evidence, contained, remediated, and validated.

## Attack Chain

Attacker IAM User
→ Vulnerable IAM Role
→ Temporary STS Credentials
→ S3 Access
→ Simulated Sensitive Data Retrieval
→ CloudTrail Investigation
→ Containment
→ Session Revocation
→ Recovery
→ Final Validation

## Project Structure

- `01-vulnerable-environment/` — Terraform deployment of the vulnerable AWS environment
- `02-attack-simulation/` — Authorized attack simulation and evidence of data access
- `03-detection/` — Detection and security monitoring
- `04-investigation/` — CloudTrail forensics, incident timeline, attack-path analysis, and containment validation
- `05-containment-remediation/` — Containment and remediation activities
- `05-final-report.md` — Final incident-response report
- `metrics.md` — Incident-response metrics
- `04-investigation/attack-chain-diagram.md` — Attack-chain visualization

## Key Findings

- Over-permissioned IAM role
- Weak IAM trust policy
- S3 access to simulated confidential data
- Successful role assumption using the attacker identity
- CloudTrail evidence of the attack chain
- Successful containment through access-key deactivation and session revocation

## Incident Response Lifecycle

1. Preparation
2. Attack Simulation
3. Detection
4. Investigation
5. Containment
6. Remediation
7. Recovery
8. Validation

## Evidence

The investigation includes:

- CloudTrail JSON evidence
- Incident timeline
- CloudTrail forensic analysis
- Attack-path summary
- Simulated sensitive-data recovery evidence
- Containment validation
- Attack-chain diagram

## Tools

- AWS IAM
- AWS S3
- AWS STS
- AWS CloudTrail
- Amazon GuardDuty
- Terraform
- Pacu
- AWS CLI
- Python

## Security Notice

This project is an authorized security laboratory using simulated data and deliberately vulnerable infrastructure. No real customer data, credentials, or production systems were targeted.

