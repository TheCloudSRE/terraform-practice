
# In Terraform, a resource block is declared using the resource keyword, 
# followed by the resource type, a local name, and a block of configuration 
# arguments enclosed in curly braces. Together, the resource type and local name 
# create a unique address for that resource within your project.

# resource "<RESOURCE_TYPE>" "<LOCAL_NAME>" 

# "<LOCAL_NAME>": A custom label you define to reference this specific resource 
# elsewhere in your Terraform code. It does not affect the name of the resource inside your actual cloud provider.

# How to Reference ResourcesTo reference attributes of a resource elsewhere in your configuration, 
# use the exact syntax <RESOURCE_TYPE>.<LOCAL_NAME>.<ATTRIBUTE>. Do not include quotation marks when referencing

resource "aws_vpc" "dev" {             # dev is local name, to be referenced in this code
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
    vpc_id = aws_vpc.dev.id              # referencing resource by it's local name
    cidr_block = "11.0.0.0/24"
    tags =  {
        Name = "My-subnet"
    }
    }