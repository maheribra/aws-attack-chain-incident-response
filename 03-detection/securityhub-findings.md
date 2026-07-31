# Security Hub Findings

## Purpose

This document records the AWS Security Hub verification performed for the AWS Attack Chain and Incident Response laboratory.

## Verification Scope

The simulated attack was executed in AWS account `275023965626`.

The attack chain included:

1. Authentication as the lab attacker IAM user.
2. Successful assumption of the vulnerable IAM role.
3. Use of temporary STS credentials obtained through `AssumeRole`.
4. Access to the vulnerable S3 environment.
5. Retrieval of simulated sensitive data.

The attack was confirmed and investigated using AWS CloudTrail evidence.

## Security Hub Verification

AWS Security Hub was queried directly in the attack-chain lab account using the AWS CLI.

The following Security Hub API operations were performed:

* `DescribeHub`
* `GetFindings`

Both operations returned:

```text
InvalidAccessException:
Account 275023965626 is not subscribed to AWS Security Hub
```

This confirms that AWS Security Hub was not enabled or subscribed in the attack-chain lab account.

## Security Hub Role in the Incident

Security Hub did **not** contribute to the detection or investigation of the simulated attack.

Specifically:

* Security Hub did not generate findings for the attack.
* Security Hub did not aggregate GuardDuty findings.
* Security Hub did not provide incident detection for the attack chain.
* Security Hub did not contribute security posture findings to the incident investigation.

The confirmed forensic evidence was instead obtained from AWS CloudTrail.

## Detection and Visibility Gap

The absence of Security Hub represents a visibility gap in the laboratory's detection architecture.

Because the account was not subscribed to Security Hub, the project did not demonstrate centralized aggregation of security findings from AWS security services.

This limitation is intentionally documented to ensure that the project accurately reflects the services that were actually operational during the attack.

## Relationship with GuardDuty

GuardDuty was also not enabled in the attack-chain lab account.

Therefore:

* GuardDuty did not generate findings for the attack.
* Security Hub did not aggregate GuardDuty findings.
* No Security Hub finding was available for correlation with the CloudTrail evidence.

The project therefore does not claim that Security Hub or GuardDuty detected the attack.

## Confirmed Evidence Source

AWS CloudTrail provided the primary confirmed evidence used to reconstruct the attack.

CloudTrail records demonstrated:

* The attacker IAM user's `AssumeRole` activity.
* Successful assumption of the vulnerable IAM role.
* Subsequent activity using the assumed-role session.
* Access to the vulnerable S3 environment.
* Retrieval of simulated sensitive data.

## Conclusion

Security Hub was verified in the attack-chain lab account and confirmed to be inactive because the account was not subscribed to the service.

**Result:**

* Security Hub enabled: **No**
* Security Hub subscribed: **No**
* Security Hub findings for the attack: **None**
* GuardDuty findings aggregated by Security Hub: **None**
* Security Hub contribution to attack detection: **None**
* Security Hub contribution to forensic investigation: **None**
* CloudTrail evidence of the attack: **Yes**
* CloudTrail used for forensic investigation: **Yes**

The project therefore accurately documents Security Hub as a security visibility gap rather than claiming it contributed to detection or incident response.
