        terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.46.0"  # AWS provider for managing AWS resources
    }

    random = {
      source = "hashicorp/random"
      version = "~> 3.4.3"  # Random provider for generating random values (e.g., passwords)
    }

    tls = {
      source = "hashicorp/tls"
      version = "~> 4.0.4"  # TLS provider for managing TLS certificates and keys
    }

    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "~> 2.2.0"  # Cloud-init provider for handling cloud-init configurations
    }

    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.16.1"  # Kubernetes provider for interacting with Kubernetes clusters
    }
  }

  backend "s3" {
    bucket         	   = "terraformstatebucketmanav"  # S3 bucket for storing Terraform state
    key              	   = "terraform/terraform.tfstate"  # Path to state file within bucket
    region         	   = "us-east-1"  # AWS region where S3 bucket is located
  }

  required_version = "~> 1.3"  # Minimum required Terraform version
}