variable "region" {
  description = "AWS region"
 type = string
 default = "us-east-1"  # Default AWS region where resources will be provisioned
}

variable "clusterName" {
  description = "Name of the EKS cluster"
 type = string
 default = "vpro-eks-manav"  # Default name for the Elastic Kubernetes Service cluster
}