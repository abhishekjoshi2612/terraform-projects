provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "my_security_group" {
  name = "ssh-allow"
  description = "to allow ssh access"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_ec2_instance" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  key_name = "ec2-access"
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
 

   
  



 connection {
    type = "ssh"
    host = self.public_ip
    user = "ubuntu"
    private_key = file("C:/Users/abhis/ec2-access.pem")
  }
 provisioner "remote-exec" {
    inline = [ "sudo apt upgrade -y" ]
 }

}
