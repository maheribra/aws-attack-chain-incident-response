# AWS Attack Chain Evidence Summary

## Attack Path

1. Attacker IAM user: `aws-attack-chain-lab-attacker`
2. Attacker successfully assumed role: `aws-attack-chain-lab-vulnerable-role`
3. Vulnerable role had broad `s3:*` permissions
4. Attacker accessed the sensitive S3 object:
   - Bucket: `aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294`
   - Key: `confidential/simulated-sensitive-data.txt`
5. Simulated sensitive data was successfully recovered.
6. CloudTrail recorded the `AssumeRole` and `GetObject` events.
7. The compromised role credentials were subsequently revoked through an explicit deny policy.
8. A post-revocation access test confirmed the deny was effective.
9. The revocation policy was removed after validation.
10. A final access test confirmed the role was restored to its original vulnerable state for continued lab analysis.

## Key Evidence

- `../04-investigation/evidence/exfiltration/sensitive-data-recovered-final.txt`
- CloudTrail evidence under `../04-investigation/evidence/cloudtrail/`
- Incident timeline
- CloudTrail forensic analysis

## Attack Chain

`IAM Attacker`
→ `AssumeRole`
→ `Vulnerable IAM Role`
→ `s3:*`
→ `Sensitive S3 Object`
→ `Data Access`
→ `CloudTrail Evidence`
→ `Credential/Session Revocation`
→ `Post-Revocation Validation`

## Confirmed CloudTrail Timeline

- 2026-07-28T11:48:39Z — Attacker assumed `aws-attack-chain-lab-vulnerable-role`.
- 2026-07-28T11:50:57Z — Assumed role accessed `confidential/simulated-sensitive-data.txt` from the sensitive S3 bucket.
- CloudTrail confirms the S3 access was performed by the assumed role session:
  `arn:aws:sts::<ACCOUNT_ID>:assumed-role/aws-attack-chain-lab-vulnerable-role/botocore-session-1785239315`

## Conclusion

The CloudTrail evidence confirms that the attacker IAM identity successfully assumed the vulnerable role and subsequently accessed the simulated sensitive S3 object using the permissions granted to that role.
