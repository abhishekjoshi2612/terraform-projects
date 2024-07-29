provider "aws" {
  region = "us-east-1"
}

module "ec2_instance_creation" {
  source = "./create_ec2"
  right_value = "right"
  wrong_ami_value = "wrong_value"
  right_ami_value = "ami-04a81a99f5ec58529"
}
