        output "cluster_name" {
  description = "Amazon Web Service EKS Cluster Name"
  value = module.eks.cluster_name  # Outputs the name of the EKS cluster from the eks module
}

output "cluster_endpoint" {
  description = "Endpoint for Amazon Web Service EKS "
  value = module.eks.cluster_endpoint  # Outputs the API endpoint URL for the EKS cluster
}

output "region" {
  description = "Amazon Web Service EKS Cluster region"
  value = var.region  # Outputs the AWS region where the cluster is deployed
}

output "cluster_security_group_id" {
  description = "Security group ID for the Amazon Web Service EKS Cluster "
  value = module.eks.cluster_security_group_id  # Outputs the ID of the default security group attached to the EKS cluster
}