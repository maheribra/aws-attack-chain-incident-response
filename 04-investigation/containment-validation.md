# Containment Validation

## Objective

Validate that the compromised assumed-role session could be contained by applying an explicit deny policy based on `aws:TokenIssueTime`.

## Test Results

### 1. Compromised Session Identified

Role:

`aws-attack-chain-lab-vulnerable-role`

Compromised session:

`arn:aws:sts::275023965626:assumed-role/aws-attack-chain-lab-vulnerable-role/assume-role`

### 2. Containment Applied

An inline deny policy named `RevokeCompromisedSessions` was attached to the compromised role.

The policy denied all actions for sessions issued before:

`2026-07-28T12:37:37Z`

### 3. Containment Validation

Attempted access to:

`s3://aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294/confidential/simulated-sensitive-data.txt`

Result:

`AccessDenied`

The error explicitly stated that access was blocked by an explicit deny in an identity-based policy.

### 4. Containment Removed

The `RevokeCompromisedSessions` inline policy was deleted.

### 5. Post-Containment Test

The same existing assumed-role session successfully accessed the S3 object after the deny policy was removed.

Result:

`GetObject succeeded`

### Conclusion

The containment control successfully blocked the compromised session while the deny policy was active.

However, removing the deny policy allowed the still-valid STS session to regain access. This demonstrates that the containment mechanism was effective but temporary and dependent on the deny policy remaining in place.

For a production incident, the response should include broader credential/session invalidation and remediation of the underlying IAM trust and permission weaknesses, followed by verification that unauthorized access is no longer possible.
