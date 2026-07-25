
data "aws_subnet" "name" {
  filter  {
    name = "tag:Name"
    values = ["Subnet-1"]
  } 
 }

 data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["137112412989"] # Official Amazon Owner ID
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "my-server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t3.small"
  subnet_id     = data.aws_subnet.name.id

  tags = {
    Name = "my-server"
  }
}       