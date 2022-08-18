# Terraform block 
# what component is this, resource, provider, variable, output
# Between 0 - 2 labels "" depending on the component
provider "aws" {
  # Expressions and arguments
  access_key = "UIERWEI9OFUIOWEFWEI"
  secret_key = var.secret_key
  region     = "eu-west-1"
}

resource "aws_instance" "demo-vm" {
  ami             = "ami-0d75513e7706cf2d9"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]
  key_name        = "qa_laptop"
}

# When running terraform we run the following commands
# terraform fmt - format our files (optional)
# terraform init - initialise the API
# terraform plan - Create a config plan
# terraform apply - apply our config plan


# Variables are a large part of the Terraform infrastructure
# Local Variables are created directly in the scope, input variables can be accessed globally 

locals {
  # List the name of a variable and the value
  version = 1.2
  name    = "instancey_mcInstancy_face"
  type    = "t2.micro"
}

resource "aws_instance" "demoVM2" {
  instance_type = local.type
  ami  = "ami-0d75513e7706cf2d9"
  tags = {
    Name = local.name
  }
}
