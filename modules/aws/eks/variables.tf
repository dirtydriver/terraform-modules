variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "Kubernetes Cluster"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "endpoint_private_access" {
  description = "Enable private access to the EKS cluster API server"
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "Enable public access to the EKS cluster API server"
  type        = bool
  default     = true
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "bastion_ip" {
  description = "IP address (CIDR block) of the bastion host for SSH access"
  type        = string
  default     = ""
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.24"
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "Region of the EKS cluster"
  type        = string
  default     = "eu-central-1"
}
