# CloudTrail Forensics

## Investigation Scope

This investigation reviewed AWS CloudTrail management and data events generated during the authorized AWS Attack Chain & Incident Response laboratory.

## Attack Chain Evidence

### 1. Initial Identity

The attack originated from the IAM user:

`arn:aws:iam::<ACCOUNT_ID>:user/aws-attack-chain-lab-attacker`

CloudTrail recorded calls to `GetCallerIdentity` from this identity.

### 2. Privilege Escalation

The attacker successfully assumed the vulnerable IAM role:

`arn:aws:iam::<ACCOUNT_ID>:role/aws-attack-chain-lab-vulnerable-role`

CloudTrail recorded multiple `AssumeRole` events from the attacker IAM user.

Example:

- Event: `AssumeRole`
- Source identity: `aws-attack-chain-lab-attacker`
- Target role: `aws-attack-chain-lab-vulnerable-role`

### 3. Role Session

The successful role assumption created an STS assumed-role session:

`arn:aws:sts::<ACCOUNT_ID>:assumed-role/aws-attack-chain-lab-vulnerable-role/botocore-session-1785239315`

### 4. Data Access

CloudTrail recorded an S3 `GetObject` event using the assumed role.

- Event: `GetObject`
- Bucket: `aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294`
- Object: `confidential/simulated-sensitive-data.txt`
- Identity: `aws-attack-chain-lab-vulnerable-role`

The object was successfully retrieved as part of the authorized simulation.

## Timeline Evidence

Key observed events:

| UTC Time | Event | Identity |
|---|---|---|
| 2026-07-28 09:15:30 | AssumeRole | aws-attack-chain-lab-attacker |
| 2026-07-28 11:43:10 | AssumeRole | aws-attack-chain-lab-attacker |
| 2026-07-28 11:44:16 | AssumeRole | aws-attack-chain-lab-attacker |
| 2026-07-28 11:45:13 | AssumeRole | aws-attack-chain-lab-attacker |
| 2026-07-28 11:48:39 | AssumeRole | aws-attack-chain-lab-attacker |
| 2026-07-28 11:50:57 | GetObject | Assumed vulnerable role |

## Findings

The investigation confirmed the following attack chain:

`Compromised IAM User`
→ `AssumeRole`
→ `Vulnerable IAM Role`
→ `STS Assumed Role Session`
→ `S3 GetObject`
→ `Simulated Sensitive Data Access`

## Evidence Location

Raw CloudTrail evidence is stored under:

`evidence/cloudtrail/`

Recovered simulated data is stored under:

`evidence/exfiltration/`

The attack path is documented in:

`evidence/attack-path-summary.md`

The broader incident chronology is documented in:

`incident-timeline.md`

## Conclusion

CloudTrail evidence confirms that the attacker IAM identity successfully assumed the deliberately vulnerable IAM role and subsequently accessed the simulated sensitive S3 object using the resulting STS session.

This activity was performed within an authorized AWS security laboratory environment.