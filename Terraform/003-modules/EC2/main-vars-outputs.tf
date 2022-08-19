# Because we are not directly running this module, no need to specify provider
resource "aws_instance" "vm" {
    ami = var.ami
    instance_type = var.type
    vpc_security_group_ids = [var.sg_id]
    tags = {
        Name = var.name
    }
}

variable "ami" {
    default = "ami-0d75513e7706cf2d9"
}

variable "type" {
    default = "t2.micro"
}

variable "name" {
    default = "demo vm"
}

variable "sg_id" {

}

output "public_ip" {
    value = aws_instance.vm.public_ip
}
