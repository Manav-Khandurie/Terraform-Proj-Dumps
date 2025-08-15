variable "PROVIDER" {
  default = "aws"  # Default cloud provider (AWS in this case)
}

variable "REGION" {
  default = "us-east-1"  # Default AWS region for resource deployment
}

variable "ZONE" {
  default = "us-east-1a"  # Default availability zone within the region
}

variable "AMIS" {
  type = map(string)  # Map of AMI IDs keyed by region
  default = {
    us-east-1 = "ami-066784287e358dad1"  # AMI ID for us-east-1 region
    us-west-1 = "ami-0a887e401f7654935"  # AMI ID for us-west-1 region
  }
}