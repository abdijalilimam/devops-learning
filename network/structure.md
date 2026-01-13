# Project Structure

This document explains the folder structure and how traffic flows through the system in this project.

---

## Folder Structure

networking/
├── README.md
├── setup-nginx.md
├── structure.md
└── screenshots/


- **README.md** – High-level overview of the project
- **setup-nginx.md** – Step-by-step EC2 and NGINX setup
- **structure.md** – Architecture and flow explanation
- **screenshots/** – Proof of setup (EC2, NGINX, DNS)

---

## Architecture Overview

This project uses a simple architecture to demonstrate core networking fundamentals.

### Components

- **User Browser** – Where the request starts
- **DNS (Domain Name System)** – Translate the domain name to an IP address
- **AWS EC2 Instance** – Virtual server running ubuntu 24.04
- **NGINX** – Web server that responds to HTTP requests

---

## Traffic Flow

User Browser
|
| HTTP (80)
v
Custom Domain (abdijalil.com)
|
v
DNS (A Record)
|
v
AWS EC2 Instance
|
v
NGINX Web Server


---

## Step-by-Step Request Explanation

1. When you enter `abdijalil.com` in the browser
2. The browser asks DNS for the IP address
3. DNS returns the EC2 public IP address
4. The request reaches the EC2 instance on port 80
5. NGINX receives the request and serves the web page

---

## Security Considerations

- SSH (port 22) is restricted to my IP
- HTTP (port 80) is open to the public

---
