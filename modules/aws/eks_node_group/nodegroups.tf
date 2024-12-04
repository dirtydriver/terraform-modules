resource "aws_eks_node_group" "eks_node_group" {
  for_each = var.node_groups

  cluster_name    = var.eks_cluster_name
  node_group_name = each.key
  node_role_arn   = var.node_role_arn
  subnet_ids      = each.value.subnets

  scaling_config {
    desired_size = each.value.desired_size
    max_size     = each.value.max_size
    min_size     = each.value.min_size
  }

  instance_types = each.value.instance_types

  update_config {
    max_unavailable = each.value.max_unavailable
  }

  tags = merge(
    var.tags,
    each.value.tags,
    {
      "Name" = each.key
    }
  )
}