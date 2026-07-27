
provider "aws" {  
    region = "ap-south-1"
}
resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "custom-vpc"
  }
}

# Creation of security group
resource "aws_security_group" "custom_sg" {
  name        = "custom-sg"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.custom_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress = [
      for port in [22, 80] : {
      description = "Allow inbound traffic on port ${port}"
      from_port   = port
      to_port     = port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = [""]
      security_groups = [""]
      self = false
      }
  ]
}

