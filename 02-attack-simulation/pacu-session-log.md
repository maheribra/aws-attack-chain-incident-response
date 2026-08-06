# Pacu Attack Simulation Session Log

## Purpose

This document records the authorized AWS attack simulation performed against the deliberately vulnerable lab environment.

## Attack Identity

- IAM User: `aws-attack-chain-lab-attacker`
- Target Role: `aws-attack-chain-lab-vulnerable-role`
- Account: `<ACCOUNT_ID>`

## Attack Sequence

1. The attacker authenticated using the designated lab IAM identity.
2. The attacker assumed the deliberately vulnerable IAM role.
3. Temporary STS credentials were issued.
4. The assumed role provided broad S3 permissions.
5. The attacker accessed the simulated sensitive-data object in the vulnerable S3 bucket.
6. CloudTrail recorded the AssumeRole and GetObject activity.
7. The activity was investigated as part of the incident-response workflow.

## Evidence

The CloudTrail investigation identified multiple AssumeRole events originating from the lab attacker IAM user and a subsequent GetObject event performed using the assumed role session.

The confirmed data-access event occurred at:

`2026-07-28T11:50:57Z`

The accessed object was:

`confidential/simulated-sensitive-data.txt`

## Result

The attack simulation successfully demonstrated the complete attack path from IAM role assumption to simulated sensitive-data access.

No real credentials, secrets, personal data, or production information were accessed. The exercise was performed exclusively within an authorized AWS security laboratory.
