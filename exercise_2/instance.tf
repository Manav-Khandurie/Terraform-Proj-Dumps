        resource "aws_instance" "terra-ec2" {
  # Using AMI ID from var.AMIS map based on selected REGION
  ami                    = var.AMIS[var.REGION]
  # Instance type (free tier eligible)
  instance_type          = "t2.micro"
  # Placement in specified availability zone
  availability_zone      = var.ZONE
  # SSH key pair for instance access
  key_name               = "manual_kp"
  # Attaching predefined security group
  vpc_security_group_ids = ["sg-02103f9c14b04239d"]
  tags = {
    Name    = "terraform"
    Project = "DevOps"
    Author  = "Manav"
  }
}