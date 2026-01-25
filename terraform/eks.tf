

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name = var.cluster_name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true
  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      name           = "ng-default"
      instance_types = ["t3.small"
      ]

      min_size     = 1
      desired_size = 1
      max_size     = 4
    }
  }

  # ✅ Correct modern EKS access control
  access_entries = {
    dev_user = {
      principal_arn = "arn:aws:iam::381492260180:user/T_DEV"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  tags = {
    Project = "tech-challenge-2"
  }
}
