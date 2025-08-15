variable "REGION" {
  default = "us-east-1"  # Default AWS region for resource deployment
}

variable "ZONE" {
  default = "us-east-1a"  # Default availability zone within the region
}

variable "USER" {
  default = "ec2-user"  # Default SSH user for EC2 instances
}

variable "KEY" {
  type = map(string)  # Map containing key pair file names
  default = {
    publickey  = "localkey.pub"  # Public key file name for SSH access
    privatekey = "localkey"      # Private key file name for SSH access
  }
}

variable "AMIS" {
  type = map(string)  # Map of AMI IDs per region
  default = {
    us-east-1 = "ami-0583d8c7a9c35822c"  # AMI ID for us-east-1 region
    us-east-2 = "ami-0d5d9d301c853a04a"  # AMI ID for us-east-2 region
  }
}