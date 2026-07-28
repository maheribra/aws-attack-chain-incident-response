# AWS Attack Chain Diagram

```mermaid
flowchart TD
    A[Attacker IAM User] --> B[AssumeRole]
    B --> C[Vulnerable IAM Role]
    C --> D[Temporary STS Credentials]
    D --> E[S3 Access]
    E --> F[Simulated Sensitive Data Access]
    F --> G[CloudTrail Evidence]
    G --> H[Investigation]
    H --> I[Containment]
    I --> J[Session Revocation]
    J --> K[Post-Revocation Access Denied]
    K --> L[Recovery and Restoration]
    L --> M[Final Validation]

```
Attack Chain Summary
Attacker authenticated as the aws-attack-chain-lab-attacker IAM user.
Attacker assumed the deliberately vulnerable IAM role.
Temporary STS credentials were issued.
The compromised role accessed the vulnerable S3 bucket.
Simulated sensitive data was retrieved.
CloudTrail recorded the attack activity.
CloudTrail evidence was investigated.
The compromised access path was contained.
Existing sessions were revoked.
Post-revocation testing confirmed access was denied.
Lab permissions were restored.
Final validation confirmed legitimate access was restored.
Evidence
incident-timeline.md
cloudtrail-forensics.md
containment-validation.md
evidence/attack-path-summary.md
evidence/exfiltration/sensitive-data-recovered-final.txt
evidence/cloudtrail/
