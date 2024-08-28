resource "aws_key_pair" "localkey" {
  key_name   = "localkey"
  public_key = file(var.KEY["publickey"])
  tags = {
    Name = "Terraform"
  }
}

resource "aws_instance" "terra_instance" {
  ami               = var.AMIS[var.REGION]
  instance_type     = "t2.micro"
  availability_zone = var.ZONE
  key_name          = aws_key_pair.localkey.key_name
  tags = {
    Name = "Terraform"
  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
  connection {
    user        = var.USER
    private_key = file(var.KEY["privatekey"])
    host        = self.public_ip
  }
}

output "dns_address" {
  value = aws_instance.terra_instance.public_dns
}
