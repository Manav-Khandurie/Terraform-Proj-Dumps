resource "aws_key_pair" "localkey" {
  key_name   = "localkey"
  public_key = file(var.KEY["publickey"])  # Reads public key from file path specified in var.KEY map
  tags = {
    Name = "Terraform"
  }
}

resource "aws_instance" "terra_instance" {
  ami               = var.AMIS[var.REGION]  # Uses AMI ID based on selected region from var.AMIS map
  instance_type     = "t2.micro"            # Instance type (free tier eligible)
  availability_zone = var.ZONE              # AZ from variable
  key_name          = aws_key_pair.localkey.key_name  # References key pair created above
  tags = {
    Name = "Terraform"
  }
  provisioner "file" {                      # Copies local script to instance
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {               # Executes commands on instance after creation
    inline = [
      "chmod u+x /tmp/web.sh",             # Makes script executable
      "sudo /tmp/web.sh"                    # Runs script with elevated privileges
    ]
  }
  connection {                              # Defines how to connect to instance for provisioning
    user        = var.USER                  # SSH username from variable
    private_key = file(var.KEY["privatekey"])  # Reads private key from file for authentication
    host        = self.public_ip            # Uses instance's public IP for connection
  }
}

output "dns_address" {                      # Outputs public DNS of the instance
  value = aws_instance.terra_instance.public_dns
}

output "PublicIP" {                         # Outputs public IP of the instance
  value = aws_instance.terra_instance.public_ip
}

output "PrivateIP" {                        # Outputs private IP of the instance
  value = aws_instance.terra_instance.private_ip
}