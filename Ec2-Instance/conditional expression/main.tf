provider "aws" {
  region = "us-east-1"
}

variable "right_value"{
    type = string
 default =  "right"
}
variable "wrong_ami_value"{
  type = string
 default =  "wrong_value"
}
variable "right_ami_value" { 
type = string
 default =  "ami-04a81a99f5ec58529"
}

resource "aws_instance" "my_ec2_instance" {
   instance_type = "t3.micro"
   ami = var.right_value == "right" ? var.right_ami_value : var.wrong_ami_value
      
}

output "my_ec2_instance" {
  description = "value of ec2 ami id"
  value = aws_instance.my_ec2_instance.ami
}


