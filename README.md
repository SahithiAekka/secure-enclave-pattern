Secure Enclave Pattern on AWS (Terraform + SSM + Ansible + Inspector)

What this demonstrates
A research-enclave style admin/security pattern:
- No inbound admin ports (no SSH/RDP exposed)
- IAM-based access using AWS Systems Manager Session Manager (SSM)
- Repeatable server baselining using Ansible
- Security validation loop using Amazon Inspector (detect → mitigate → validate)

Architecture
- VPC + subnet + route
- EC2 instance with IAM role for SSM
- Security group with  no inbound rules
- Baseline applied via Ansible playbook

Evidence (screenshots)
1- No inbound ports
![No inbound ports](screenshots/01-no-inbound.png)

2- Access via SSM (no SSH)
![SSM session](screenshots/02-ssm-session.png)

3- Automated baseline applied
- Ansible play succeeded
- `enclaveuser` created
- `/etc/motd` banner written
![Ansible success](screenshots/03-ansible-success.png)

4- Vulnerability findings (before)
Inspector detected Medium CVEs related to bootstrap tooling installed on the instance.
![Inspector before](screenshots/04-inspector-before.png)

5- Remediation action
Removed Ansible packages after baselining to reduce attack surface.
![Remediation proof](screenshots/05-remediation-ansible-removed.png)

6- Validation (after)
Inspector findings may remain active until the next scan/evaluation cycle completes.
![Inspector after](screenshots/06-inspector-after-pending.png)

How to deploy

cd terraform
terraform init
terraform apply
