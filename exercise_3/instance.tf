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
  availability_zone = var.ZONE              # Deploy in specified availability zone
  key_name          = aws_key_pair.localkey.key_name  # Use the key pair created above
  tags = {
    Name = "Terraform"
  }
  provisioner "file" {
    source      = "web.sh"                  # Local script to upload
    destination = "/tmp/web.sh"             # Destination path on instance
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",             # Make script executable
      "sudo /tmp/web.sh"                   # Execute the script with elevated privileges
    ]
  }
  connection {
    user        = var.USER                  # SSH username for connection
    private_key = file(var.KEY["privatekey"])  # Private key for SSH authentication
    host        = self.public_ip            # Connect to instance's public IP
  }
}

output "dns_address" {
  value = aws_instance.terra_instance.public_dns  # Output the public DNS of the instance
}