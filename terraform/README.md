# Terraform Troubleshooting Notes

## 1. InvalidAMIID.NotFound
* **Problem:** AMI ID didn't exist in the targeted region.
* **Fix:** Matched the provider region in `provider.tf` to the actual region where the AMI lives.

## 2. MissingInput: No subnets found
* **Problem:** Default VPC had no subnets available.
* **Fix:** Added an `aws_subnet` resource block to `ec2.tf` and linked it to the instance via `subnet_id = aws_subnet.my_new_subnet.id`.

## 3. Invalid AWS Region vs Availability Zone
* **Provider Region:** Must be general (e.g., `us-east-2`).
* **Subnet AZ:** Must be specific (e.g., `us-east-2a`).