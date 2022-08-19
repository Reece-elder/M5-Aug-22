provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region

    default_tags {
        tags = {
            project = "VPC-Demo"
        }
    }
}

resource "aws_vpc" "custom" {
    cidr_block = var.cidr_block
}

resource "aws_subnet" "pub-a" {
    vpc_id = aws_vpc.custom.id
    cidr_block = var.cidr_block_a
    map_public_ip_on_launch = true
    availability_zone = var.av_a
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.custom.id
}

resource "aws_route_table" "pub-rt" {
    vpc_id = aws_vpc.custom.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}

resource "aws_route_table_association" "rt-a" {
    subnet_id = aws_subnet.pub-a.id
    route_table_id = aws_route_table.pub-rt.id
}

resource "aws_security_group" "custom-sg" {
    vpc_id = aws_vpc.custom.id

    ingress {
        from_port = 22
        to_port = 22
        protcol = "tcp"
        cidr_block = "0.0.0.0/0"
    }

        ingress {
        from_port = 80
        to_port = 80
        protcol = "tcp"
        cidr_block = "0.0.0.0/0"
    }

        ingress {
        from_port = 3306
        to_port = 3306
        protcol = "tcp"
        cidr_block = "0.0.0.0/0"
    }

}

resource "aws_instance" "demo-vm"{
    ami = var.ami
    instance_type = var.type
    subnet_id = aws_subnet.pub-a.id
    vpc_security_group_ids = [aws_security_group.custom-sg.id]
    key_name = var.key-name
}
