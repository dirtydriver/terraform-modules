# AWS Bastion EC2 Instance Type and key pair
variable "instance_type" {
  description = "bastion Instance Type"
  type        = string
  default     = "t3.micro"
}
variable "key_name" {
  description = "AWS EC2 Key pair that need to be associated with bastion Instance"
  type        = string
  default     = ""
}

variable "name" {
  description = "Environment Name"
  type        = string
  default     = ""
}

variable "vpc_id" {
    type = string
}

variable "public_subnet_ids" {
    type = list(string)
}