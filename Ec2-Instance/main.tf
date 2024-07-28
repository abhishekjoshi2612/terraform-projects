provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "my_ec2_instance" {
   instance_type = "t3.micro"
   ami = "ami-04a81a99f5ec58529"
}
