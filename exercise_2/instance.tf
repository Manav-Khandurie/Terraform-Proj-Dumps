resource "aws_instance" "terra-ec2" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE
  key_name               = "manual_kp"
  vpc_security_group_ids = ["sg-02103f9c14b04239d"]
  tags = {
    Name    = "terraform"
    Project = "DevOps"
    Author  = "Manav"
  }
}