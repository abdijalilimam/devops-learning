# 1. Look up your existing VPC (the one from your error message)
data "aws_vpc" "default" {
  default = true
}

# 2. Create a new Subnet inside that VPC
resource "aws_subnet" "my_new_subnet" {
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = "172.31.128.0/20" # A standard IP range for default VPCs
  availability_zone = "us-east-2a"      # Change this to match your specific region (e.g., us-west-2a)

  tags = {
    Name = "Terraform-Created-Subnet"
  }
}

# 3. Deploy your EC2 instance into the new subnet
resource "aws_instance" "this" {
  ami           = "ami-0fe18bc3cfa53a248" 
  instance_type = "t2.micro"
  
  # This links the EC2 instance directly to the subnet above
  subnet_id     = aws_subnet.my_new_subnet.id 

  tags = {
    Name = "MyInstance"
  }
}