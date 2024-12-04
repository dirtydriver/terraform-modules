variable "node_groups" {
  description = "Map of node group configurations"
  type = map(object({
    desired_size    = number
    max_size        = number
    min_size        = number
    instance_types  = list(string)
    max_unavailable = number
    subnets         = list(string)
    tags            = map(string)
  }))
  default = {}
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "Node role ARN created under the EKS role section"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}