
module "my_ec2_instance" {
#  source = "../Day-8-terraform-modules-ec2"
    source = "github.com/TheCloudSRE/terraform-practice/Day-8-terraform-modules-ec2"
  ami_id = "ami-0b910d1016287a5e7"
  instance_type = "t3.micro"
  tags = "MyInstanceUpdated"
}

resource "aws_vpc" "main" {
  cidr_block = "13.0.0.0/16"
}


