


#3. Create Instance resource
resource "aws_instance" my_instance {
  ami           = var.ami_id  # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  subnet_id     = "subnet-0ba09904282378fe5"
      tags = {
    Name = "MyInstanceUpdated"
  }
}

resource "aws_vpc" "name" {
cidr_block = "10.0.0.0/16"
tags = {
Name = "dev"
}
}
