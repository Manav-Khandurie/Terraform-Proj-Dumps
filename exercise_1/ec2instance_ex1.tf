provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "terra-ec2" {
  ami                    = "ami-066784287e358dad1"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "manual_kp"
  vpc_security_group_ids = ["sg-02103f9c14b04239d"]
  tags = {
    Name    = "terraform"
    Project = "DevOps"
    Author  = "Manav"
  }
}