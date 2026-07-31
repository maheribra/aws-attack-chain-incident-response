# Incident Remediation

## Objective

Remediate the vulnerabilities that enabled the simulated attack and reduce the risk of future unauthorized access.

---

## 1. IAM Remediation

### Actions

- Review the permissions assigned to the compromised identity.
- Remove unnecessary permissions.
- Apply least-privilege access.
- Review IAM role trust policies.
- Restrict cross-account role assumption where unnecessary.
- Remove permissions that allow unauthorized privilege escalation.

### Validation

After remediation:

- Re-run IAM security analysis.
- Confirm unnecessary permissions have been removed.
- Confirm the simulated attack path is no longer available.

---

## 2. S3 Remediation

### Actions

- Confirm S3 Block Public Access is enabled.
- Review bucket policies.
- Remove unnecessary bucket permissions.
- Restrict sensitive object access to authorized principals.
- Review IAM policies that allow access to sensitive S3 resources.

### Validation

After remediation:

- Confirm unauthorized principals cannot access the sensitive object.
- Confirm authorized access continues to function.
- Re-run security scanning against the environment.

---

## 3. CloudTrail Remediation

### Actions

- Maintain CloudTrail logging.
- Enable S3 Data Events for sensitive objects.
- Enable log file validation.
- Use multi-region logging where appropriate.
- Monitor sensitive S3 object access.

### Validation

Confirm that future S3 object-level API activity generates CloudTrail Data Events.

---

## 4. Detection and Monitoring

The investigation demonstrated that CloudTrail Data Events can provide visibility into sensitive S3 object access.

Recommended improvements:

- Monitor sensitive S3 GetObject activity.
- Alert on unexpected identities accessing sensitive objects.
- Investigate unusual source IP addresses.
- Monitor suspicious AssumeRole activity.
- Correlate IAM role assumption with subsequent S3 access.

---

## 5. Re-Validation

After remediation, the following validation activities should be performed:

1. Re-run IAM security analysis.
2. Re-run S3 security analysis.
3. Re-run Prowler against the environment.
4. Confirm CloudTrail Data Events are still enabled.
5. Attempt the previously demonstrated attack path again in the controlled lab.
6. Confirm that the attack path is no longer successful.

---

## Remediation Status

**IAM:** Pending validation

**S3:** Pending validation

**CloudTrail:** Logging and S3 Data Events confirmed

**Detection:** CloudTrail Data Event successfully captured the simulated GetObject activity

**Final security validation:** Pending