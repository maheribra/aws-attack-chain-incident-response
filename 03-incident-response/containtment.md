# Incident Containment

## Objective

Contain the simulated security incident and prevent further unauthorized access to the sensitive S3 object.

---

## Immediate Containment Actions

### 1. Identify the Compromised Identity

The CloudTrail investigation identified the following identity:

- Role: OrganizationAccountAccessRole
- Session: botocore-session-1785494057
- Account: 275023965626

The identity was treated as potentially compromised for the purposes of the incident simulation.

---

### 2. Revoke or Restrict Access

In a real incident, the security team would immediately:

- Revoke active credentials associated with the compromised identity where possible.
- Remove unnecessary permissions.
- Restrict access to sensitive S3 resources.
- Review IAM policies and trust relationships.
- Investigate whether the identity was used to access additional resources.

---

### 3. Protect the Sensitive S3 Object

The affected resource was:

- Bucket: aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294
- Object: confidential/simulated-sensitive-data.txt

Recommended containment actions:

- Remove unnecessary public access.
- Restrict bucket and object access to authorized principals.
- Review bucket policies and IAM policies.
- Enable S3 Block Public Access.
- Confirm that only intended identities can access the object.

---

### 4. Preserve Evidence

The following evidence was preserved before remediation:

- CloudTrail GetObject event
- Incident timeline
- Incident findings report
- Source IP address
- IAM identity information
- Affected S3 resource information

Evidence should be preserved before making destructive changes to the environment.

---

## Containment Status

**Status:** Simulated containment plan documented.

**Confirmed compromise:** Unauthorized access to the simulated sensitive S3 object.

**Evidence preserved:** Yes.

**Remediation:** Pending.

---

## Next Phase

The next phase is remediation.

The environment will be hardened by:

1. Reviewing IAM permissions.
2. Reviewing IAM trust policies.
3. Restricting access to the sensitive S3 bucket.
4. Re-validating the environment with security scanning.
5. Confirming that the attack path is no longer exploitable.