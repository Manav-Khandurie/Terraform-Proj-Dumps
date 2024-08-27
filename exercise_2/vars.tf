variable "PROVIDER" {
  default = "aws"
}

variable "REGION" {
  default = "us-east-1"
}

variable "ZONE" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-066784287e358dad1"
    us-west-1 = "ami-0a887e401f7654935"
  }
}