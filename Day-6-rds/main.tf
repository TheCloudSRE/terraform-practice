
resource "aws_db_instance" "custom_rds" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  identifier           = "mydbinstance"
  username             = "admin"
  password             = "password123"
  # managed_master_user_password = true # for aws secret manager
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  publicly_accessible  = false
  maintenance_window = "Mon:00:00-Mon:03:00"
  db_subnet_group_name = aws_db_subnet_group.custom_rds_subnet_group.id
  vpc_security_group_ids = [aws_security_group.custom_sg.id]
  backup_window = "03:00-06:00"     
}

resource "aws_vpc" "custom_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "custom-vpc"
    }   
}

resource "aws_subnet" "custom_subnet" {
    vpc_id            = aws_vpc.custom_vpc.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "ap-south-1a"

    tags = {
        Name = "custom-subnet"
    }
}

resource "aws_subnet" "custom_subnet2" {
    vpc_id            = aws_vpc.custom_vpc.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    tags = {
        Name = "custom-subnet2"
    }
}

resource "aws_db_subnet_group" "custom_rds_subnet_group" {
  name       = "custom-rds-subnet-group"
  subnet_ids = [aws_subnet.custom_subnet.id, aws_subnet.custom_subnet2.id]

  tags = {
    Name = "custom-rds-subnet-group"
  }
}

resource "aws_security_group" "custom_sg" {
  name        = "custom-sg"
  description = "Allow MySQL inbound traffic"
  vpc_id      = aws_vpc.custom_vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_db_instance" "replica" {
    identifier              = "mydbinstance-replica"
    instance_class          = "db.t3.micro"
    engine                  = "mysql"
    engine_version          = "8.0"
    publicly_accessible     = false
    db_subnet_group_name    = aws_db_subnet_group.custom_rds_subnet_group.id
    vpc_security_group_ids  = [aws_security_group.custom_sg.id]
    replicate_source_db     = aws_db_instance.custom_rds.arn
    skip_final_snapshot     = true
    }