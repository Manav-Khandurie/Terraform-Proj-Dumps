provider "kubernetes" {
  host = module.eks.cluster_endpoint  # EKS cluster endpoint for Kubernetes provider
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)  # Decode base64 CA cert for cluster auth
}

provider "aws" {
  region = var.region  # AWS region from variable
}

data "aws_availability_zones" "available" {}  # Fetch available AZs in current region

locals {
  cluster_name = var.clusterName  # Local variable for EKS cluster name
}