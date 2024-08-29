variable "BACKEND_BACKET" {
  default = "terraformstatebucketmanav"
}

variable "REGION" {
  default = "us-east-1"
}

variable "ZONE" {
  type = map(string)
  default = {
    1 = "us-east-1a"
    2 = "us-east-1b"
    3 = "us-east-1c"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "KEY" {
  type = map(string)
  default = {
    name       = "vpc_ec2"
    publickey  = "vpc_ec2.pub"
    privatekey = "vpc_ec2"
  }
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0583d8c7a9c35822c"
    us-east-2 = "ami-0d5d9d301c853a04a"
  }
}

variable "MY_IP" {
  default = "0.0.0.0/0"
}