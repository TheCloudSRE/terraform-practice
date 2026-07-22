
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

# Creation of Internet Gateway
resource "aws_internet_gateway" "custom_igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "custom-igw"
  }
}

# Creation of route table and route table association
resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_igw.id
  }

  tags = {
    Name = "custom-route-table"
  }
}

resource "aws_route_table_association" "custom_route_table_association" {
  subnet_id      = aws_subnet.custom_subnet.id
  route_table_id = aws_route_table.custom_route_table.id
}

# Creation of security group
resource "aws_security_group" "custom_sg" {
  name        = "custom-sg"
  description = "Allow SSH and HTTP inbound traffic"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Creation of EC2 instance
resource "aws_instance" "custom_ec2" {
  ami                         = "ami-0b910d1016287a5e7"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.custom_subnet.id
  vpc_security_group_ids     = [aws_security_group.custom_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "custom-ec2"
  }
}



