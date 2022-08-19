resource "aws_security_group" "allow_ssh" {

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

output "sg_id"{
    value = aws_security_group.allow_ssh.id
}
