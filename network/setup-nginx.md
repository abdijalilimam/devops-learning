# NGINX Setup on EC2

This document explains how NGINX was installed and configured on an EC2 instance.

---

## 1. Launch EC2
- Ubuntu 22.04
- t2.micro or t3.micro
- Security Group:
  - SSH (22) from my IP
  - HTTP (80) from anywhere

---

## 2. Connect to EC2
```bash
ssh -i key.pem ubuntu@EC2_PUBLIC_IP

