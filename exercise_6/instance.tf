        resource "aws_key_pair" "vpc_ec2" {
  key_name   = var.KEY["name"]  # Key pair name from variables
  public_key = file(var.KEY["publickey"])  # Public key loaded from file path specified in variables
  tags = {
    Name = "Terraform"
  }
}

resource "aws_instance" "terra_instance" {
  ami                    = var.AMIS[var.REGION]  # AMI ID selected based on region variable
  instance_type          = "t2.micro"  # Instance type (free tier eligible)
  subnet_id              = aws_subnet.private_subnet_1.id  # Launch instance in private subnet
  key_name               = aws_key_pair.vpc_ec2.key_name  # Use the created key pair
  vpc_security_group_ids = [aws_security_group.vpc_sg.id]  # Attach security group
  tags = {
    Name = "Terraform"
  }
#   provisioner "file" {
#     source      = "web.sh"
#     destination = "/tmp/web.sh"
#   }
#   provisioner "remote-exec" {
#     inline = [
#       "chmod u+x /tmp/web.sh",
#       "sudo /tmp/web.sh"
#     ]
#   }
#   connection {
#     user        = var.USER
#     private_key = file(var.KEY["privatekey"])
#     host        = self.public_ip
#     timeout     = "2m"
#   }
}

resource "aws_ebs_volume" "vpc_volume" {
  availability_zone = var.ZONE[1]  # Create volume in second availability zone from list
  size              = 3  # 3GB volume size
  tags = {
    Name = "Terraform"
  }
}

resource "aws_volume_attachment" "attach_vpc_volume" {
  device_name = "/dev/xvdh"  # Standard EBS device name
  instance_id = aws_instance.terra_instance.id  # Attach to created instance
  volume_id   = aws_ebs_volume.vpc_volume.id  # Use the created EBS volume
}

output "dns_address" {
  value = aws_instance.terra_instance.public_dns  # Output instance public DNS
}

output "PublicIP" {
  value = aws_instance.terra_instance.public_ip  # Output instance public IP
}

output "PrivateIP" {
  value = aws_instance.terra_instance.private_ip  # Output instance private IP
}