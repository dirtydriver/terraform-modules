resource "aws_eks_cluster" "k8s_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_role.arn
  count = length(var.subnet_ids)

  vpc_config {
    subnet_ids = element(var.subnet_ids,count.index)
    vpc_id = var.vpc_id
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}