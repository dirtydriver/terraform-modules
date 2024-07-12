variable "cluster_name" {
    type = string
    default = "Kubernetes Cluster"
}

variable "subnet_ids" {
    type = list(string)
}

variable "vpc_id" {
    type = string
}


