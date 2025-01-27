
data "aws_vpc" "default" {
  id = var.vpc_id
}

data "aws_subnet" "existing" {
  id = var.aws_public_subnet  # Existing subnet ID
  vpc_id = var.vpc_id  # Add VPC ID to narrow down the search
}

module "ec2" {
  source = "./module/ec2"
  region = var.region
  vpc_id = var.vpc_id  # Pass vpc_id to the ec2 module
  aws_public_subnet = var.aws_public_subnet
  aws_security_group = var.aws_security_group
  instance_type = var.instance_type
  aws_route_table = var.aws_route_table
  aws_internet_gateway = var.aws_internet_gateway
  ec2_ami = var.ec2_ami
}

module "eks_al2" {
  source = "./module/eks"
  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  cluster_role_arn = var.cluster_role_arn
  cluster_endpoint_public_access = var.cluster_endpoint_public_access
  subnet_ids = var.subnet_ids  # Correctly pass subnet_ids
  tags = var.tags
}

resource "aws_eks_node_group" "demo" {
  cluster_name    = module.eks_al2.cluster_name
  node_group_name = "demo"
  node_role_arn   = var.node_role_arn  # Use the existing role ARN
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.eks_desired_size
    max_size     = var.eks_max_size
    min_size     = var.eks_min_size
  }

  update_config {
    max_unavailable = 1
  }
}