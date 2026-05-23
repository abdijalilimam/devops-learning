# AWS Assignment 1 - VPC & Networking

## Objective

Build a custom AWS network environment using a VPC with public and private subnets, internet connectivity, route tables, EC2 instances, and security groups.

---

# Architecture

Internet
↓
Internet Gateway
↓
Public Subnet
↓
Public EC2 (Bastion Host)
↓
Private EC2
↓
NAT Gateway
↓
Internet Access for Private Subnet

---

# Services Used

- Amazon VPC
- Subnets
- Internet Gateway
- NAT Gateway
- Elastic IP
- Route Tables
- EC2
- Security Groups
- CloudWatch Monitoring

---

# Network Configuration

| Resource | Configuration |
|---|---|
| VPC CIDR | 10.0.0.0/16 |
| Public Subnet | 10.0.1.0/24 |
| Private Subnet | 10.0.2.0/24 |

---

# Internet Access Setup

## Public Subnet
Connected to the internet using:
- Internet Gateway
- Public Route Table

Route:
```text
0.0.0.0/0 → Internet Gateway
