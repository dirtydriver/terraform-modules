output "endpoint" {
  value = aws_eks_cluster.k8s_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.k8s_cluster.certificate_authority[0].data
}

output "cluster_name" {
  value = aws_eks_cluster.k8s_cluster.name
}

output "node_role_arn" {
  value = aws_iam_role.nodes.arn
}