resource "aws_eks_cluster" "k8s_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = var.subnet_ids
    endpoint_public_access = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
    security_group_ids     = var.endpoint_private_access ? [aws_security_group.eks_security_group[0].id] : []
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}