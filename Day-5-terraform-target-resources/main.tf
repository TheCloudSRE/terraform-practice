

# terraform target command is used to apply changes to specific resources in a 
# Terraform configuration. 
# It allows you to focus on a subset of resources, rather than applying changes to the 
# entire infrastructure. 
# This can be useful for testing or when you want to make 
# changes to specific components without affecting the rest of the infrastructure.
# Ex. $ terraform plan -target=aws_vpc.custom_vpc -target=aws_subnet.custom_subnet 
# Ex. $ terraform plan -target=aws_security_group.custom_sg -target=aws_instance.custom_ec2    

# Creation of VPC with custom network configuration
resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "dev"
  }
}

# Creation of subnet
resource "aws_subnet" "custom_subnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "public-subnet1"
  }
}