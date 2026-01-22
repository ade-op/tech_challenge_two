module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name


  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Lets EKS create the API endpoint; keep public access ON for now (simpler)
  cluster_endpoint_public_access = true

  enable_irsa = true

  # Managed node group (autoscaling)
  eks_managed_node_groups = {
    default = {
      name           = "ng-default"
      instance_types = ["t3.small"]

      min_size     = 1
      desired_size = 1
      max_size     = 4
    }
  }

  tags = {
    "Project" = "tech-challenge-2"
  }
}
