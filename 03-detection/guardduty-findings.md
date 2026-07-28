# GuardDuty Findings

## Purpose

This document records the GuardDuty detection component of the AWS Attack Chain and Incident Response laboratory.

## Detection Objective

GuardDuty was configured as part of the detection layer to identify suspicious activity associated with the simulated attack chain.

## Attack Activity Monitored

- IAM role assumption
- Temporary STS credential usage
- Access to the vulnerable S3 environment
- Simulated sensitive-data retrieval

## Investigation Correlation

CloudTrail provided the primary forensic evidence used to reconstruct the attack timeline. The investigation identified repeated AssumeRole activity from the lab attacker IAM user followed by a GetObject event using the assumed vulnerable-role session.

## Result

The detection layer was included in the incident-response workflow and correlated with CloudTrail evidence during investigation.

## Note

This laboratory demonstrates the integration of AWS detection and forensic capabilities. The primary confirmed evidence for the simulated attack was obtained from CloudTrail logs.

No real credentials, secrets, personal data, or production information were involved in the exercise.
