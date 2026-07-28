# AWS Security Hub Findings

## Purpose

This document records the Security Hub component of the AWS Attack Chain and Incident Response laboratory.

## Detection and Compliance Role

AWS Security Hub was used as part of the defensive security layer to centralize security findings and provide visibility into the security posture of the AWS environment.

## Attack Chain Correlation

The Security Hub findings were considered alongside GuardDuty and CloudTrail evidence during the incident-response workflow.

The primary forensic evidence used to reconstruct the attack was obtained from CloudTrail. The investigation confirmed:

- Multiple AssumeRole events involving the vulnerable IAM role.
- Temporary STS credentials issued for the assumed-role sessions.
- A confirmed S3 GetObject event using the compromised role session.
- Retrieval of the simulated sensitive-data object.

## Response Workflow

Security Hub formed part of the defensive workflow:

Detection
-> Investigation
-> Containment
-> Remediation
-> Recovery
-> Validation

## Result

The Security Hub layer supported the overall security monitoring and incident-response process. CloudTrail remained the primary source of detailed forensic evidence for the simulated attack.

No real credentials, secrets, personal data, or production information were involved in the exercise.
