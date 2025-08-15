module "vpc" {
  source = "terraform-aws-modules/vpc/aws"  # Uses the official AWS VPC module
  version = "3.14.2"  # Pinned module version for stability

  name = "vprofile-eks"  # VPC name indicating it's for EKS cluster

  cidr = "172.20.0.0/16"  # Main VPC CIDR block
  azs = slice(data.aws_availability_zones.available.names, 0, 3)  # Use first 3 available AZs

  private_subnets = ["172.20.1.0/24", "172.20.2.0/24", "172.20.3.0/24"]  # CIDRs for private subnets
  public_subnets = ["172.20.4.0/24", "172.20.5.0/24", "172.20.6.0/24"]  # CIDRs for public subnets

  enable_nat_gateway = true  # Enable NAT for private subnet internet access
  single_nat_gateway = true  # Use single NAT gateway to reduce costs
  enable_dns_hostnames = true  # Enable DNS hostnames for EC2 instances

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"  # Tag for EKS cluster auto-discovery
    "kubernetes.io/role/elb" = 1  # Indicates subnet can be used for external ELBs
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"  # Tag for EKS cluster auto-discovery
    "kubernetes.io/role/internal-elb" = 1  # Indicates subnet can be used for internal ELBs
  }
}