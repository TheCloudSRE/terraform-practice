resource "aws_vpc" "my_vpc" {
  cidr_block =  "10.0.0.0/16"   
    tags = {
        Name = "my_vpc"
    }  
   }

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bt-name-123456789"  # Ensure this name is globally unique
    tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
  # depends_on = [aws_vpc.my_vpc]  # Ensure the VPC is created before the S3 bucket
} 

resource "aws_instance" "my_instance" {
  ami           = "ami-0b910d1016287a5e7"  # Example AMI ID, replace with a valid one for your region
  instance_type = "t3.micro"
  tags = {
    Name = "MyInstance"
  }
  depends_on = [aws_s3_bucket.my_bucket]  # Ensure the S3 bucket is created before the EC2 instance
}