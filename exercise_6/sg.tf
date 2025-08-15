        resource "aws_security_group" "vpc_sg" {
  name        = "Terraform_VPC_allow_ssh"  # Security group name visible in AWS console
  description = "Allow SSH inbound traffic from anywhere and all outbound traffic"  # Description of security group purpose
  vpc_id      = aws_vpc.main.id  # Associates this security group with the main VPC

  # Allow all outbound traffic
  egress {
    from_port   = 0  # 0 means all ports
    to_port     = 0
    protocol    = "-1"  # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic to all IP addresses
  }

  # Allow SSH from anywhere
  ingress {
    from_port   = 22  # SSH default port
    to_port     = 22
    protocol    = "tcp"  # SSH uses TCP protocol
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP address
  }


  # Allow SSH from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP from anywhere
  ingress {
    from_port   = 80  # HTTP default port
    to_port     = 80
    protocol    = "tcp"  # HTTP uses TCP protocol
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP address
  }

  tags = {
    Name = "Terraform"  # Tag for resource identification and organization
  }
}