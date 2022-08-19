provider "aws" {
  region     = "eu-west-1"
  access_key = ""
  secret_key = ""
}

module "sg" {
  source = "./SG"
}

module "ec2_a" {
  source = "./EC2"
  name   = "new-name"
  # Accessing the output of a different module for this variable
  sg_id = module.sg.sg_id
}

module "ec2_b" {
  source = "./EC2"
  # Accessing the output of a different module for this variable
  sg_id = module.sg.sg_id
  type = "t3.micro"
}
