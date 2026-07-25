resource "aws_instance" "my-server" {
    ami = "ami-09d88f7c4c272b0c5"
    instance_type = "t3.small"
    tags = {
        Name = "my-server"
    }
  }

# 1. Create empty resource block for aws_instance.my-server. 
    #This is required to import the existing instance into Terraform's state file.
# 2. $ terraform import aws_instance.my-server i-0754273382aa13411 <- updates the
    # statefile
# 3. $ terraform plan   <--Run terraform plan. Terraform will show discrepancies 
    # because your main.tf is empty, but the state file now holds the true 
    # values. You must manually copy variables (like ami or instance_type) 
    # into your main.tf file until terraform plan shows "No changes".
# 4. Add the variables to your main.tf file and run terraform plan again. 
# 5. $ terraform plan <-- Repeat this step until terraform plan shows "No changes".