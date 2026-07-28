# AWS Attack Chain — Incident Timeline

## Incident Summary

An authorized attack simulation was conducted against the deliberately vulnerable
AWS Attack Chain Lab account.

Account ID: 275023965626
Region: eu-west-1
Attacker IAM User: aws-attack-chain-lab-attacker
Vulnerable IAM Role: aws-attack-chain-lab-vulnerable-role
Sensitive S3 Bucket: aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294

## Attack Chain

aws-attack-chain-lab-attacker
        |
        | sts:GetCallerIdentity
        v
Attacker identity confirmed
        |
        | sts:AssumeRole
        v
aws-attack-chain-lab-vulnerable-role
        |
        | sts:GetCallerIdentity
        v
Assumed-role session established
        |
        | s3:GetObject
        v
Sensitive S3 object accessed
        |
        v
confidential/simulated-sensitive-data.txt
        |
        v
Sensitive data successfully retrieved

## Verified CloudTrail Timeline

### 1. Initial Attacker Identity Verification

Timestamp:
2026-07-28T09:15:20Z

Event:
GetCallerIdentity

Identity:
arn:aws:iam::275023965626:user/aws-attack-chain-lab-attacker

Result:
Successful

---

### 2. Privilege Escalation / Role Assumption

Timestamp:
2026-07-28T09:15:30Z

Event:
AssumeRole

Source Identity:
arn:aws:iam::275023965626:user/aws-attack-chain-lab-attacker

Target Role:
arn:aws:iam::275023965626:role/aws-attack-chain-lab-vulnerable-role

Result:
Successful

---

### 3. Confirmed Assumed-Role Session

Timestamp:
2026-07-28T11:48:39Z

Event:
GetCallerIdentity

Identity:
arn:aws:sts::275023965626:assumed-role/aws-attack-chain-lab-vulnerable-role/botocore-session-1785239315

Result:
Successful

---

### 4. Sensitive Data Access

Timestamp:
2026-07-28T11:50:57Z

Event:
GetObject

Identity:
arn:aws:sts::275023965626:assumed-role/aws-attack-chain-lab-vulnerable-role/botocore-session-1785239315

S3 Bucket:
aws-attack-chain-lab-sensitive-a4d694d045bb26b29bc1375294

S3 Object:
confidential/simulated-sensitive-data.txt

Result:
Successful

Evidence:
The object was successfully downloaded and recovered as:

sensitive-data-recovered.txt

## Attack Outcome

The attack simulation successfully demonstrated that the low-privileged IAM user
aws-attack-chain-lab-attacker could assume the vulnerable IAM role and use the
resulting temporary credentials to access a sensitive S3 object.

No real credentials, personal data, or production information were exposed.
The retrieved object contained simulated confidential data created specifically
for this authorized security laboratory.

## Evidence Location

CloudTrail evidence:

04-investigation/evidence/cloudtrail/

Recovered simulated data:

02-attack-simulation/sensitive-data-recovered.txt

## Security Impact

The vulnerable trust relationship and role permissions created an attack path
from a low-privileged IAM identity to sensitive data access.

Primary risks demonstrated:

- Unauthorized role assumption
- Privilege escalation through IAM trust relationships
- Excessive permissions on the assumed IAM role
- Sensitive S3 data exposure
- Insufficient preventative IAM controls

## Investigation Status

Attack chain: CONFIRMED

CloudTrail evidence: CONFIRMED

Role assumption: CONFIRMED

Sensitive data access: CONFIRMED

Sensitive data retrieval: CONFIRMED

Remediation: PENDING

## Detection and Monitoring Assessment

### CloudTrail
- Status: Enabled
- Region: eu-west-1
- Attack activity captured: Yes
- Evidence: CloudTrail records confirmed the attacker IAM user assumed the vulnerable role and subsequently accessed the simulated sensitive S3 object.

### Amazon GuardDuty
- Status: Not enabled in the attack-chain lab account (275023965626)
- Region checked: eu-west-1
- Detection of simulated attack: Not available
- Note: GuardDuty findings retrieved during investigation belonged to a separate account (018134828551) and were excluded from this incident.

### AWS Security Hub
- Status: Not subscribed in the attack-chain lab account (275023965626)
- Region checked: eu-west-1
- Findings generated for this incident: None
- Note: Security Hub was not active during the simulated attack.

### Detection Conclusion
CloudTrail successfully provided forensic evidence of the simulated attack chain. However, the lab account did not have GuardDuty or Security Hub enabled at the time of the attack. Therefore, the incident was observable through CloudTrail logs but lacked active threat-detection and centralized security-finding capabilities.