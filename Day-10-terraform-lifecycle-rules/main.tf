
resource "aws_instance" "my_instance" {
  # ami = "ami-0b910d1016287a5e7"
  ami           = "ami-09d88f7c4c272b0c5"
  instance_type = "t3.micro"

  tags = {
    Name = "MyInstance"
  }
 lifecycle {
  ignore_changes = [tags]   
} 
}

# 
  # lifecylce {
  # create_before_destroy = true   # First create and then destroy the resource
  #}
#
  #lifecycle {
  #  prevent_destroy = true   # Prevent accidental deletion of the resource
  #} 
#
  #lifecycle {
  #  ignore_changes = [tags]   # Ignore changes to the tags attribute
  #}   
#
  #lifecycle {
  #  replace_triggered_by = [aws_s3_bucket.my_bucket]   # Replace the resource if the S3 bucket changes
  #} 
#
  #
  #  custom_timeouts {
  #    create = "10m"   # Set a custom timeout for resource creation
  #    delete = "5m"    # Set a custom timeout for resource deletion
  #    update = "15m"    # Set a custom timeout for resource updates
  #  }
  #

  
#resource "aws_instance" "my_instance" {
#  # ami = "ami-0b910d1016287a5e7"
#  ami           = "ami-09d88f7c4c272b0c5"
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "MyInstance"
#  }
#  timeouts {
#    create = "10m"
#    delete = "5m"
#  }
#}