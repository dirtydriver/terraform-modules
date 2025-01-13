output "cluster_endpoint" {
  value = aws_eks_cluster.k8s_cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.k8s_cluster.certificate_authority[0].data
}

output "cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.k8s_cluster.name
}

output "node_role_arn" {
  description = "Node IAM Role ARN"
  value       = aws_iam_role.nodes.arn
}

output "cluster_id" {
  description = "EKS Cluster ID"
  value       = aws_eks_cluster.k8s_cluster.id
}

output "kubeconfig" {
  description = "Minimal kubeconfig file content for the AWS EKS cluster"
  value = templatefile("${path.module}/kubeconfig.tpl", {
    cluster_arn                        = aws_eks_cluster.k8s_cluster.arn
    cluster_name                       = aws_eks_cluster.k8s_cluster.name
    cluster_endpoint                   = aws_eks_cluster.k8s_cluster.endpoint
    cluster_certificate_authority_data = aws_eks_cluster.k8s_cluster.certificate_authority[0].data
    region                             = var.aws_region
  })
}