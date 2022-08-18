# Terraform block 
# what component is this, resource, provider, variable, output
# Between 0 - 2 labels "" depending on the component
provider "aws" {
  # Expressions and arguments
  access_key = "UEFUEFIOEFNWFONWEFWEF"
  secret_key = "HDWD7QWE9FENFEF0E0WENEUFEWIWE9009"
  region     = "eu-west-1"
}

resource "aws_instance" "demo-vm" {
  ami           = "ami-0d75513e7706cf2d9"
  instance_type = "t2.micro"
}

# When running terraform we run the following commands
# terraform fmt - format our files (optional)
# terraform init - initialise the API
# terraform plan - Create a config plan
# terraform apply - apply our config plan