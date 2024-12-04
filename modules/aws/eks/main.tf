resource "aws_eks_cluster" "k8s_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn
  version  = var.cluster_version  # Add version variable

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_public_access = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
    security_group_ids     = var.endpoint_private_access ? [aws_security_group.eks_security_group[0].id] : []
  }

  tags = var.tags  # Add tags variable
  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
} 