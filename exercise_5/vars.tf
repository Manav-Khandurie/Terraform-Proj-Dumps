variable "BACKEND_BACKET" {
  default = "terraformstatebucketmanav"
}

variable "REGION" {
  default = "us-east-1"
}

variable "ZONE" {
  default = "us-east-1a"
}

variable "USER" {
  default = "ec2-user"
}

variable "KEY" {
  type = map(string)
  default = {
    publickey  = "localkey.pub"
    privatekey = "localkey"
  }
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0583d8c7a9c35822c"
    us-east-2 = "ami-0d5d9d301c853a04a"
  }
}