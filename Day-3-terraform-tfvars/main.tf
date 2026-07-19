
# 1. Reference your existing custom VPC using its ID
data "aws_vpc" "selected" {
  id = "vpc-0ff1995e460cdf12c" # Replace with your actual VPC ID
}

resource "aws_instance" my_instance {
  ami           = var.ami_id  # Amazon Linux 2 AMI
  instance_type = var.instance_type
  subnet_id              = "subnet-0a8e297680095158c"
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
    tags = {
    Name = var.tags
  }
}

# 3. Create a Security Group inside the specified VPC
resource "aws_security_group" "instance_sg" {
  name        = "ec2-security-group"
  description = "Security group for EC2 instance"
  vpc_id      = data.aws_vpc.selected.id # Explicitly links the SG to your VPC

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allows SSH from anywhere (restrict this in production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}