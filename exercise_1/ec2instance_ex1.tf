provider "aws" {
  region = "us-east-1"  # AWS provider configuration for us-east-1 region
}

resource "aws_instance" "terra-ec2" {
  ami                    = "ami-066784287e358dad1"  # Amazon Machine Image ID for the EC2 instance
  instance_type          = "t2.micro"               # Instance type (free tier eligible)
  availability_zone      = "us-east-1a"             # Specific AZ within the region
  key_name               = "manual_kp"              # SSH key pair name for instance access
  vpc_security_group_ids = ["sg-02103f9c14b04239d"] # Security group ID(s) for network access control
  tags = {
    Name    = "terraform"  # Resource name tag
    Project = "DevOps"     # Project identifier tag
    Author  = "Manav"      # Creator tag
  }
}