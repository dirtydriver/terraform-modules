variable "eks_cluster_name" {
  type = string
}

variable "node_group_name" {
    type = string
    default = "${var.eks_cluster_name}-node-group"
  
}

variable "node_role_arn" {
    type = string
    description = "Its node role arn what is created under the eks role section"
}


variable "eks_subnets" {
    type = list()
}

variable "desired_size" {
    type = number
}

variable "max_size" {
    type = number
}

variable "min_size" {
    type = number
}

variable "max_unavailable" {
    type = number
}