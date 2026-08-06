# AWS Attack Chain Diagram

## Visual Attack Path

![AWS Attack Chain Diagram](images/aws-attack-chain-diagram.png)

---

## Attack Chain Summary

1. Attacker authenticated as the `aws-attack-chain-lab-attacker` IAM user.
2. The attacker assumed the deliberately vulnerable IAM role.
3. Temporary STS credentials were issued.
4. The compromised role accessed the vulnerable S3 bucket.
5. Simulated sensitive data was retrieved.
6. AWS CloudTrail recorded the attack activity.
7. CloudTrail evidence was investigated.
8. The compromised access path was contained.
9. Existing sessions were revoked.
10. Post-revocation testing confirmed access was denied.
11. Lab permissions were restored.
12. Final validation confirmed legitimate access was restored.

---

## Evidence

- `incident-timeline.md`
- `cloudtrail-forensics.md`
- `containment-validation.md`
- `evidence/attack-path-summary.md`
- `evidence/exfiltration/sensitive-data-recovered-final.txt`
- `evidence/cloudtrail/`