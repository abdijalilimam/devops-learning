# Deploy WordPress Using Terraform on AWS

A hands-on DevOps project that provisions and deploys a WordPress server on AWS EC2 using Terraform. This project covers infrastructure as code, networking configuration, and cloud deployment from scratch.

---

## Project Overview

This project uses Terraform to automate the creation of AWS infrastructure and deploy a WordPress site on an Ubuntu EC2 instance. It demonstrates real-world DevOps skills including infrastructure as code, cloud networking, and debugging production issues.

**Stack:** Terraform · AWS EC2 · Ubuntu 22.04 · Apache · PHP · WordPress

---

## Architecture

```
Internet
    │
    ▼
Internet Gateway
    │
    ▼
Default VPC (us-east-2)
    │
    ▼
Public Subnet
    │
    ▼
EC2 Instance (t2.micro)
├── Apache Web Server
├── PHP 8.1
└── WordPress
    │
Security Group
├── Port 80 (HTTP) — open to world
└── Port 22 (SSH) — open to world
```

---

## Infrastructure Created by Terraform

| Resource | Details |
|---|---|
| Provider | AWS us-east-2 (Ohio) |
| AMI | Ubuntu 22.04 LTS |
| Instance Type | t2.micro |
| Security Group | HTTP (80) + SSH (22) |
| Key Pair | my-key |
| User Data | Apache + PHP + WordPress install script |

---

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) installed
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured
- An AWS account with an EC2 key pair created in `us-east-2`
- Your `.pem` key file downloaded locally

---

## Project Structure

```
terraform/wordpress/
├── main.tf               # Core infrastructure
├── variables.tf          # Input variables
├── outputs.tf            # Public IP and DNS outputs
├── terraform.tfvars      # Variable values
├── user_data.sh          # WordPress install script
└── README.md
```

---

## How to Deploy

**1. Clone the repo**
```bash
git clone <your-repo-url>
cd terraform/wordpress
```

**2. Initialize Terraform**
```bash
terraform init
```

**3. Preview the plan**
```bash
terraform plan
```

**4. Deploy**
```bash
terraform apply
```

**5. Get the public IP**
```bash
terraform output instance_public_ip
```

**6. Visit WordPress**
```
http://<instance_public_ip>
```

**7. Destroy when done (to avoid AWS charges)**
```bash
terraform destroy
```

---

## Issues Encountered and How They Were Fixed

This project involved significant real-world debugging. Every issue below was encountered, diagnosed, and resolved during deployment.

---

### 1. Wrong AWS Region — Key Pair Not Found

**Error:**
```
InvalidKeyPair.NotFound: The key pair 'my-key' does not exist
```

**Cause:** The key pair was created in `us-east-2` (Ohio) but Terraform was configured to deploy to `us-east-1` (N. Virginia). Key pairs are region-specific in AWS.

**Fix:** Updated `variables.tf` to set the default region to `us-east-2` to match where the key pair existed.

---

### 2. Subnet Data Source Returning Empty List

**Error:**
```
data.aws_subnets.all.ids is empty list of string
```

**Cause:** The `aws_subnets` data source was querying for subnets but returning nothing because the default VPC had no subnets associated with it.

**Diagnosis:** Ran `aws ec2 describe-subnets --region us-east-2` which confirmed zero subnets existed.

**Fix:** Recreated the default subnets in all three availability zones using the AWS CLI:
```bash
aws ec2 create-default-subnet --availability-zone us-east-2a --region us-east-2
aws ec2 create-default-subnet --availability-zone us-east-2b --region us-east-2
aws ec2 create-default-subnet --availability-zone us-east-2c --region us-east-2
```

---

### 3. Security Group in Wrong VPC

**Error:**
```
The security group 'sg-xxx' does not exist in VPC 'vpc-xxx'
```

**Cause:** The security group was initially created without a `vpc_id`, so AWS placed it in a different VPC than the one being used for the EC2 instance.

**Fix:** Added `vpc_id = data.aws_vpc.default.id` to the security group resource, then removed the old one from Terraform state and redeployed:
```bash
terraform state rm aws_security_group.wordpress_sg
terraform apply
```

---

### 4. SSH Hanging — Blackhole Route in Route Table

**Cause:** Even after the instance launched with a public IP, SSH connections hung indefinitely. Investigation revealed the default VPC's main route table had a `0.0.0.0/0` route pointing to a deleted internet gateway, showing status `blackhole`.

**Diagnosis:**
```bash
aws ec2 describe-route-tables --region us-east-2 \
  --filters "Name=vpc-id,Values=<vpc-id>" "Name=association.main,Values=true" \
  --query "RouteTables[*].Routes" --output table
```

Output showed `GatewayId: igw-xxx` with `State: blackhole`.

**Fix:** Created a new internet gateway, attached it to the VPC, and replaced the broken route:
```bash
aws ec2 create-internet-gateway --region us-east-2
aws ec2 attach-internet-gateway --internet-gateway-id <new-igw> --vpc-id <vpc-id> --region us-east-2
aws ec2 replace-route --route-table-id <rtb-id> --destination-cidr-block 0.0.0.0/0 --gateway-id <new-igw> --region us-east-2
```

---

### 5. SSH Key File Permissions Too Open

**Error:**
```
Permissions 0644 for 'my-key.pem' are too open.
This private key will be ignored.
```

**Cause:** The `.pem` file had loose permissions. SSH refuses to use a private key that other users on the system can read.

**Fix:**
```bash
chmod 400 ~/Downloads/my-key.pem
```

---

### 6. WordPress Never Installed — user_data Ran Before Internet Was Available

**Cause:** The `user_data.sh` script ran at instance boot time, but at that moment the internet gateway was still broken (blackhole route). So `apt-get` couldn't reach the Ubuntu package servers, Apache never installed, and WordPress was never downloaded.

**Fix:** After fixing the internet gateway, SSHed into the instance and ran the install manually:
```bash
sudo apt-get update -y && sudo apt-get install -y apache2 php php-mysql libapache2-mod-php wget
cd /var/www/html
sudo wget -q https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo cp -r wordpress/* .
sudo rm -rf wordpress latest.tar.gz
sudo chown -R www-data:www-data /var/www/html
sudo systemctl restart apache2
```

---

## Key Lessons Learned

- AWS resources like key pairs, subnets, and internet gateways are **region-specific** — always verify your Terraform region matches your AWS Console region
- Default VPC networking can be broken or incomplete in AWS accounts — subnets and internet gateways may need to be recreated
- A `blackhole` route in a route table silently blocks all outbound traffic — SSH hanging with no error is a strong signal to check routing
- `user_data` scripts run at boot time with whatever network state exists — if networking is broken at boot, the script will silently fail
- Always set `chmod 400` on `.pem` key files before SSH

---

## Result

WordPress successfully deployed and accessible via public IP on AWS EC2, fully provisioned through Terraform infrastructure as code.