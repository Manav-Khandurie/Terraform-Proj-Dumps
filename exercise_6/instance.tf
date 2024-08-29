resource "aws_key_pair" "vpc_ec2" {
  key_name   = var.KEY["name"]
  public_key = file(var.KEY["publickey"])
  tags = {
    Name = "Terraform"
  }
}

resource "aws_instance" "terra_instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet_1.id
  key_name               = aws_key_pair.vpc_ec2.key_name
  vpc_security_group_ids = [aws_security_group.vpc_sg.id]
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
  availability_zone = var.ZONE[1]
  size              = 3
  tags = {
    Name = "Terraform"
  }
}

resource "aws_volume_attachment" "attach_vpc_volume" {
  device_name = "/dev/xvdh"
  instance_id = aws_instance.terra_instance.id
  volume_id   = aws_ebs_volume.vpc_volume.id
}

output "dns_address" {
  value = aws_instance.terra_instance.public_dns
}

output "PublicIP" {
  value = aws_instance.terra_instance.public_ip
}

output "PrivateIP" {
  value = aws_instance.terra_instance.private_ip
}