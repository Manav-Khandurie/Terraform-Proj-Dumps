resource "aws_key_pair" "localkey" {
  key_name   = "localkey"
  public_key = file(var.KEY["publickey"])  # Load public key from file path specified in var.KEY
  tags = {
    Name = "Terraform"
  }
}

resource "aws_instance" "terra_instance" {
  ami               = var.AMIS[var.REGION]  # Lookup AMI ID based on region variable
  instance_type     = "t2.micro"            # Instance type (free tier eligible)
  availability_zone = var.ZONE              # AZ from variable
  key_name          = aws_key_pair.localkey.key_name  # Use key pair created above
  tags = {
    Name = "Terraform"
  }
  provisioner "file" {
    source      = "web.sh"                  # Local script to upload
    destination = "/tmp/web.sh"             # Destination path on instance
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",              # Make script executable
      "sudo /tmp/web.sh"                    # Execute script with elevated privileges
    ]
  }
  connection {
    user        = var.USER                  # SSH username from variable
    private_key = file(var.KEY["privatekey"])  # Private key for SSH auth
    host        = self.public_ip            # Connect to instance's public IP
  }
}

output "dns_address" {
  value = aws_instance.terra_instance.public_dns  # Output public DNS of instance
}

output "PublicIP" {
  value = aws_instance.terra_instance.public_ip  # Output public IP of instance
}

output "PrivateIP" {
  value = aws_instance.terra_instance.private_ip  # Output private IP of instance
}