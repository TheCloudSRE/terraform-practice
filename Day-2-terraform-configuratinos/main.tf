resource "aws_vpc" "dev" {
  cidr_block = var.cidr_block
  tags = {
    Name = var.tag
    }
}



resource "aws_vpc" "test" {
  cidr_block = "15.0.0.0/16"
  tags = {
    Name = var.Name1
    }
}

  resource "aws_subnet" "name" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "11.0.0.0/24"
    tags =  {
        Name = "My-subnet"
    }
    }