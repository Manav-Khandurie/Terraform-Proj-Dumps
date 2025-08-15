        module "eks" {
  source = "terraform-aws-modules/eks/aws"  # Uses the official AWS EKS Terraform module
  version = "19.0.4"  # Pinned module version for stability

  cluster_name = local.cluster_name  # Cluster name derived from local variable
  cluster_version = "1.27"  # Kubernetes version to deploy

  vpc_id = module.vpc.vpc_id  # VPC ID from VPC module output
  subnet_ids = module.vpc.private_subnets  # Private subnets from VPC module output
  cluster_endpoint_public_access = true  # Enables public API server access

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"  # Default Amazon Linux 2 AMI for x86_64 instances
  }

  eks_managed_node_groups = {
    one = {
      name = "node-group-1"  # First node group name

      instance_types = ["t3.small"]  # Instance type for nodes in this group

      min_size = 1  # Minimum number of nodes
      max_size = 3  # Maximum number of nodes
      desired_size = 2  # Desired number of nodes
    }

    two = {
      name = "node-group-2"  # Second node group name

      instance_types = ["t3.small"]  # Instance type for nodes in this group

      min_size = 1  # Minimum number of nodes
      max_size = 2  # Maximum number of nodes
      desired_size = 1  # Desired number of nodes
    }
  }
}