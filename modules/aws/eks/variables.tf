variable "cluster_name" {
    type = string
    default = "Kubernetes Cluster"
}

variable "subnet_ids" {
    type = list(string)
}

variable "authentication_mode" {
  type = string
  default = "API"
}

variable "endpoint_private_access" {
    type = bool
    default = false 
}

variable "endpoint_public_access" {
    type = bool
    default = true
  
}

variable "vpc_id" {
    type = string
}

variable "bastion_ip" {
    type = string 
}
