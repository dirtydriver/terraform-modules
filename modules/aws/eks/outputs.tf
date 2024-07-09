output "endpoint" {
  value = data.aws_eks_cluster.k8s_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = data.aws_eks_cluster.k8s_cluster.certificate_authority[0].data
}

output "node_role_arn" {
  value = aws_iam_role.nodes.arn
}