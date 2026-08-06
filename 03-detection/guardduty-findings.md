# GuardDuty Findings

## Purpose

This document records the GuardDuty verification performed for the AWS Attack Chain and Incident Response laboratory.

## Verification Scope

The simulated attack was executed in AWS account `<ACCOUNT_ID>`.

The attack chain included:

1. Authentication as the lab attacker IAM user.
2. Successful assumption of the vulnerable IAM role.
3. Use of temporary STS credentials obtained through `AssumeRole`.
4. Access to the vulnerable S3 environment.
5. Retrieval of simulated sensitive data.

The attack activity was independently confirmed through AWS CloudTrail evidence documented in the investigation phase.

## GuardDuty Verification

GuardDuty was checked directly in the attack-chain lab account using the AWS CLI.

The verification returned:

```text
DetectorIds: []
```

This confirms that no GuardDuty detector was enabled in AWS account `<ACCOUNT_ID>` at the time of verification.

## Detection Result

**GuardDuty did not detect the simulated attack.**

The reason is that GuardDuty was not enabled in the attack-chain lab account. Therefore, no GuardDuty findings were generated for the attack chain.

This is documented as a **detection gap** in the laboratory rather than as a successful GuardDuty detection.

## Confirmed Detection and Forensic Evidence

The primary confirmed evidence of the attack was obtained from AWS CloudTrail.

CloudTrail records showed:

* The lab attacker IAM user performing `AssumeRole`.
* Successful assumption of `aws-attack-chain-lab-vulnerable-role`.
* Subsequent activity using the assumed-role session.
* Access to the vulnerable S3 environment.
* Retrieval of simulated sensitive data.

The CloudTrail evidence was used to reconstruct the attack timeline and establish the sequence of events.

## Detection Gap

The attack chain demonstrated that CloudTrail provided the necessary forensic evidence to investigate the activity, but GuardDuty was not available as an active detection mechanism in the lab account.

As a result, the laboratory did not demonstrate an actual GuardDuty alert or finding for the simulated attack.

This limitation is intentionally documented to ensure that the project does not overstate the capabilities or results of the detection architecture.

## Conclusion

GuardDuty was verified in the attack-chain lab account and found to be inactive because no GuardDuty detector was configured.

**Result:**

* GuardDuty detection of the attack: **No**
* GuardDuty detector enabled: **No**
* GuardDuty finding generated for the attack: **No**
* CloudTrail evidence of the attack: **Yes**
* CloudTrail used for forensic investigation: **Yes**

The project therefore demonstrates a confirmed attack and successful forensic reconstruction using CloudTrail, while identifying the absence of GuardDuty as a detection-layer gap.
