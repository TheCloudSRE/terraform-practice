
resource "aws_instance" "example" {
  ami           = "ami-09d88f7c4c272b0c5"
  instance_type = "t3.micro"

  #user_data = <<-EOF
  #            #!/bin/bash
  #            yum install git -y
  #            yum install httpd -y
  #            systemctl start httpd
  #            systemctl enable httpd
  #            echo "Hello, World!" > /var/www/html/index.html
  #            EOF
  user_data = file("userdata.sh")
  tags = {
    Name = "ExampleInstance"
  }
}   