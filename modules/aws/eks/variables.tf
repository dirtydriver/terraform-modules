variable "cluster_name" {
    type = string
    default = "Kubernetes Cluster"
}

variable "subnet_ids" {
    type = list()
}

variable "vpc_id" {
    type = string
}


