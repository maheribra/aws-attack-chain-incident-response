# AWS Attack Chain & Incident Response — Final Report

## 1. Executive Summary

This project demonstrates a complete AWS attack-to-incident-response lifecycle in an authorized security laboratory. A deliberately vulnerable AWS environment was deployed using Terraform, subjected to an authorized attack simulation, investigated using CloudTrail evidence, contained, remediated, and validated.

The simulated attack demonstrated how excessive IAM permissions and weak role trust configuration can allow an attacker-controlled IAM identity to assume a vulnerable role, obtain temporary STS credentials, access an S3 bucket, and retrieve simulated sensitive data.

The incident-response phase then reconstructed the attack using CloudTrail evidence, contained the compromised access path, revoked active sessions, restored the lab environment, and performed post-remediation validation.

## 2. Environment

The laboratory environment consisted of:

- AWS IAM attacker identity
- Deliberately vulnerable IAM role
- Weak role trust configuration
- Broad permissions on the vulnerable role
- S3 bucket containing simulated confidential data
- AWS CloudTrail logging
- GuardDuty detection layer
- Security Hub detection and security-posture layer
- Prowler security validation

Terraform was used to deploy and manage the intentionally vulnerable environment.

## 3. Attack Chain

The confirmed attack path was:

Attacker IAM User
-> AssumeRole
-> Vulnerable IAM Role
-> Temporary STS Credentials
-> S3 Access
-> Simulated Sensitive Data Retrieval

The attacker identity `aws-attack-chain-lab-attacker` successfully assumed the role `aws-attack-chain-lab-vulnerable-role`.

CloudTrail evidence confirmed multiple AssumeRole events followed by a confirmed S3 GetObject event at `2026-07-28T11:50:57Z`.

The accessed object was `confidential/simulated-sensitive-data.txt`.

No real credentials, secrets, personal data, or production information were involved.

## 4. Detection

The defensive visibility layer consisted of AWS CloudTrail, with GuardDuty and Security Hub assessed as part of the detection architecture.

CloudTrail provided the primary confirmed forensic evidence used to reconstruct the attack sequence. The investigation identified the attacker IAM identity, the assumed vulnerable role, the temporary STS session, and the subsequent S3 data-access event.

GuardDuty was verified in the attack-chain lab account and was not enabled at the time of testing. Therefore, GuardDuty did not generate a finding for the simulated attack.

Security Hub was also verified and the lab account was not subscribed to the service. Therefore, Security Hub did not generate or aggregate findings for the simulated attack.

The project therefore demonstrates a confirmed attack reconstructed through CloudTrail, while explicitly documenting GuardDuty and Security Hub as detection and visibility gaps in the laboratory environment.

## 5. Investigation

The investigation correlated CloudTrail events across the attack timeline.

The key evidence included:

- Five confirmed AssumeRole events involving the vulnerable role.
- One confirmed S3 GetObject event using the assumed-role session.
- The attacker IAM identity associated with the role-assumption activity.
- The vulnerable S3 bucket and simulated sensitive-data object.

The forensic investigation was documented in `04-investigation/cloudtrail-forensics.md`.

## 6. Containment

The compromised access path was contained through access revocation and session invalidation.

Post-containment testing confirmed that access using the revoked compromised session resulted in `Access Denied`.

This demonstrated that the containment control successfully blocked the compromised session while the explicit deny policy was active. The still-valid STS session could regain access after the policy was removed, demonstrating that the containment mechanism was temporary and dependent on the deny policy remaining in place.

## 7. Remediation

The vulnerable environment was remediated following the attack simulation.
Security validation was performed using the documented Prowler assessment process.

The remediation workflow focused on reducing excessive permissions, validating IAM access controls, and ensuring that the compromised access path could no longer be used.

## 8. Recovery

Following containment and remediation, the laboratory environment was restored to its intended operational state.

Lab permissions were restored and legitimate access was re-established for continued authorized testing.

## 9. Validation

Final validation confirmed:

- Compromised session access was denied after revocation.
- Lab permissions were restored.
- Legitimate access was restored.
- CloudTrail evidence was preserved.
- Security validation documentation was completed.

The project therefore demonstrated the complete lifecycle from vulnerable configuration through attack, investigation, containment, remediation, recovery, and validation.

## 10. Metrics

The confirmed attack timeline was:

- First confirmed AssumeRole event: `2026-07-28T09:15:30Z`
- Confirmed sensitive-data access: `2026-07-28T11:50:57Z`
- Attack simulation window: 2 hours 35 minutes 27 seconds
- Confirmed AssumeRole events: 5
- Confirmed S3 GetObject events: 1
- Post-revocation access result: Access Denied

Exact Mean Time to Detect and Mean Time to Contain were not measured with synchronized alert and response timestamps and are therefore not claimed as measured metrics.

## 11. Lessons Learned

The exercise demonstrated several key security lessons:

1. IAM role trust policies must be narrowly scoped.
2. IAM permissions should follow the principle of least privilege.
3. Temporary STS credentials can provide significant access when the assumed role is over-permissioned.
4. CloudTrail is critical for reconstructing AWS identity and data-access activity.
5. Session revocation is an important containment mechanism following credential compromise.
6. Security validation should occur after remediation to confirm that controls are effective.
7. Attack simulation and defensive investigation should be tested together to validate the complete incident-response process.

## 12. Evidence

The project contains evidence covering the complete attack and incident-response lifecycle.

Environment Deployment
- `01-vulnerable-environment/terraform/`

Contains the Terraform configuration used to deploy the deliberately vulnerable AWS environment.

Attack Simulation
- `02-attack-simulation/pacu-session-log.md`
- `02-attack-simulation/privilege-escalation-steps.md`

Documents the authorized attack simulation, IAM role assumption, privilege-escalation path, and attack execution.

Detection Assessment
- `03-detection/guardduty-findings.md`
- `03-detection/securityhub-findings.md`

Documents the verification of GuardDuty and Security Hub and the identified detection and visibility gaps.

Incident Response
- `03-incident-response/incident-findings.md`
- `03-incident-response/incident-timeline.md`
- `03-incident-response/containment.md`
- `03-incident-response/remediation.md`

Documents the incident findings, response timeline, containment actions, and remediation process.

Forensic Investigation
- `04-investigation/cloudtrail-forensics.md`
- `04-investigation/incident-timeline.md`
- `04-investigation/attack-chain-diagram.md`
- `04-investigation/evidence/attack-path-summary.md`
- `04-investigation/containment-validation.md`

Documents the CloudTrail forensic analysis, reconstructed attack timeline, attack path, attack-chain visualization, and containment validation.

Forensic Evidence
- `04-investigation/evidence/cloudtrail/`

Contains preserved CloudTrail log evidence used during the forensic investigation.

- `04-investigation/evidence/exfiltration/sensitive-data-recovered-final.txt`

Contains the simulated sensitive-data retrieval evidence from the authorized attack simulation.

Remediation and Security Validation
- `05-containment-remediation/before-after-prowler-scan.md`

Documents the security validation process and before-and-after remediation assessment using Prowler.

Incident-Response Metrics
- `metrics.md`

Documents the measurable incident-response and security-validation metrics associated with the exercise.

Final Project Documentation
- `05-final-report.md`

This report consolidates the attack, investigation, detection assessment, containment, remediation, recovery, validation, findings, metrics, and lessons learned.

## Conclusion

This project demonstrates practical cloud security engineering and incident-response capabilities across offensive security, cloud logging, forensic investigation, containment, remediation, and validation. It provides an end-to-end example of how an AWS security incident can be simulated, investigated, contained, and validated within a controlled environment.
