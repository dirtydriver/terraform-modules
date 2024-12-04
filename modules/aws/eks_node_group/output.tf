output "node_group_names" {
  description = "Names of the EKS node groups"
  value       = [for ng in aws_eks_node_group.eks_node_group : ng.node_group_name]
}

output "node_group_arns" {
  description = "ARNs of the EKS node groups"
  value       = { for key, ng in aws_eks_node_group.eks_node_group : key => ng.arn }
}