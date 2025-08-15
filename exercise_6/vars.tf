variable "BACKEND_BACKET" {
  default = "terraformstatebucketmanav"  # S3 bucket name for storing Terraform state
}

variable "REGION" {
  default = "us-east-1"  # Default AWS region for resource deployment
}

variable "ZONE" {
  type = map(string)
  default = {
    1 = "us-east-1a"  # Availability Zone 1 in us-east-1
    2 = "us-east-1b"  # Availability Zone 2 in us-east-1
    3 = "us-east-1c"  # Availability Zone 3 in us-east-1
  }
}

variable "USER" {
  default = "ec2-user"  # Default SSH user for EC2 instances
}

variable "KEY" {
  type = map(string)
  default = {
    name       = "vpc_ec2"      # Key pair name for EC2 instances
    publickey  = "vpc_ec2.pub"  # Public key file name
    privatekey = "vpc_ec2"      # Private key file name
  }
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0583d8c7a9c35822c"  # AMI ID for us-east-1 region
    us-east-2 = "ami-0d5d9d301c853a04a"  # AMI ID for us-east-2 region
  }
}

variable "MY_IP" {
  default = "0.0.0.0/0"  # Default IP for security group access (all open - insecure)
}