# AWS Attack Chain & Incident Response — Metrics

## Attack Timeline

- Initial attacker activity: 2026-07-28T09:15:20Z
- First successful role assumption: 2026-07-28T09:15:30Z
- Successful S3 data access: 2026-07-28T11:50:57Z

## Detection

- Detection source: AWS CloudTrail
- GuardDuty: GuardDuty detector present in separate account; no relevant finding generated for this lab attack chain
- CloudTrail evidence collected: 35 compressed JSON evidence files

## Containment

- Compromised attacker access key: Disabled
- Vulnerable role session revocation policy: Applied
- Existing compromised session: Successfully denied access
- Post-revocation validation: Successful

## Recovery

- Revocation policy removed after validation
- Lab permissions restored
- S3 access revalidated successfully

## Attack Chain

1. Attacker IAM user authenticated
2. Vulnerable role assumed
3. Temporary STS credentials obtained
4. S3 permissions abused
5. Simulated sensitive data accessed
6. Evidence collected
7. Compromised access contained
8. Session access revoked
9. Access restored after validation

## Key Outcome

The attack chain was successfully simulated, investigated using CloudTrail evidence, contained through credential and session controls, and validated through post-containment testing.
