# Before vs After Prowler Security Validation

## Purpose

This document records the security validation performed before and after remediation of the deliberately vulnerable AWS environment.

## Before Remediation

The initial environment intentionally contained insecure configurations to support the authorized attack simulation.

Key risks included:

- Broad IAM permissions including `s3:*`
- Weak IAM role trust configuration
- Access to a vulnerable S3 bucket
- Potential exposure of simulated sensitive data

Prowler was used to assess the security posture and identify configuration weaknesses.

## Incident Response

Following the simulated compromise, the attack path was investigated using CloudTrail evidence.

Containment actions included:

- Revoking compromised access
- Testing existing session access
- Confirming that revoked sessions could no longer access the protected S3 object

## Remediation

The vulnerable configuration was restored to the intended secure lab state after the attack simulation.

The compromised role session was revoked and access controls were validated.

## After Remediation

Post-remediation validation confirmed that:

- The temporary compromised session was denied access after revocation.
- The vulnerable lab permissions were restored for continued authorized testing.
- The simulated sensitive-data object remained accessible only through the intended lab access path.
- CloudTrail evidence was preserved for forensic analysis.

## Validation Result

The before-and-after assessment demonstrates the complete security lifecycle:

Vulnerable Configuration
-> Attack Simulation
-> Detection
-> Investigation
-> Containment
-> Remediation
-> Recovery
-> Validation

## Conclusion

The exercise demonstrated how security scanning can be used alongside offensive testing and incident-response validation to identify weaknesses, confirm containment, and verify the security posture after remediation.
