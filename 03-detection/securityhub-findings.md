# Security Hub Findings

## Purpose

This document records the AWS Security Hub verification performed for the AWS Attack Chain and Incident Response laboratory.

The purpose of this phase was to determine whether Security Hub contributed to detection, security posture analysis, or investigation of the simulated AWS attack chain.

## Verification Scope

The simulated attack was executed in AWS account `<ACCOUNT_ID>`.

The attack chain included:

1. Authentication as the lab attacker IAM user.
2. Successful assumption of the vulnerable IAM role.
3. Use of temporary STS credentials obtained through `AssumeRole`.
4. Access to the vulnerable S3 environment.
5. Retrieval of simulated sensitive data.

The attack activity was confirmed through AWS CloudTrail evidence.

## Initial Security Hub Verification

During the initial investigation phase, AWS Security Hub was not enabled in the attack-chain lab account.

CLI verification returned:

InvalidAccessException:
Account `<ACCOUNT_ID>` is not subscribed to AWS Security Hub

At this stage:

- Security Hub generated no findings.
- GuardDuty findings were not aggregated.
- Security posture checks were unavailable.

This represented an initial visibility gap in the laboratory environment.

## Security Hub Enablement

Security Hub was subsequently enabled to evaluate AWS security posture and demonstrate centralized security findings.

After enablement, Security Hub performed security posture assessments across AWS resources.

The account generated Security Hub findings from multiple AWS security capabilities.

## Current Security Hub Findings

After enabling Security Hub, findings were generated across several categories:

- AWS Security Hub CSPM posture checks.
- Amazon GuardDuty coverage checks.
- IAM configuration checks.
- S3 security checks.
- EC2 and VPC security posture checks.

Current findings summary:

- Total findings: 69
- Critical findings: 3
- High findings: 5
- Medium findings: 22
- Low findings: 4
- Informational findings: 35

These findings demonstrate Security Hub's ability to provide centralized visibility into AWS security posture.

## Security Hub Role in the Incident

Security Hub did not directly detect the simulated attack chain.

The attack was identified and reconstructed primarily through AWS CloudTrail evidence.

However, Security Hub provided additional security context by identifying configuration weaknesses that increased the attack surface.

Examples include:

- IAM security posture issues.
- Missing or incomplete security controls.
- AWS service coverage gaps.
- Resource configuration weaknesses.

## Relationship with GuardDuty

GuardDuty was not active during the original attack execution.

Therefore:

- GuardDuty did not generate an attack finding.
- Security Hub did not correlate an attack finding.
- CloudTrail remained the primary forensic evidence source.

After Security Hub enablement, GuardDuty-related coverage findings became visible through Security Hub.

## Confirmed Attack Evidence Source

AWS CloudTrail provided the primary evidence used to reconstruct the attack timeline.

CloudTrail records demonstrated:

- The attacker IAM user performing `AssumeRole`.
- Successful assumption of `aws-attack-chain-lab-vulnerable-role`.
- Use of assumed-role credentials.
- Access to vulnerable AWS resources.
- Retrieval of simulated sensitive data.

## Security Gap Identified

The project demonstrated an important security operations lesson:

Security controls must be enabled before an incident occurs.

During the attack simulation:

- CloudTrail provided forensic visibility.
- GuardDuty was unavailable for threat detection.
- Security Hub was unavailable for centralized security findings.

After enablement:

- Security Hub provided centralized security posture management.
- Security findings were generated.
- AWS security services could be monitored from one location.

## Conclusion

Security Hub was initially unavailable during the attack simulation but was later enabled to evaluate AWS security posture and centralized findings management.

Final results:

- Security Hub enabled: Yes
- Security Hub findings generated: Yes
- Security Hub detected the simulated attack: No
- Security Hub provided security posture visibility: Yes
- GuardDuty findings aggregated: Coverage findings only
- CloudTrail evidence of attack: Yes
- CloudTrail used for forensic investigation: Yes

The project demonstrates both the limitations of relying only on CloudTrail for detection and the importance of enabling AWS security services before an incident occurs.