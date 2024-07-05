variable "tags" {
    type = map(string)
    default = {
      "Name" = "Terraform Vpc"
    }
  
}

variable "vpc_cdir" {
    type = string
    default = "10.0.0.0/16"
}
variable "public_subnet_cdirs" {
    type = list(string)
    description = "List of public subnet CDIRS"  
}

variable "private_subnet_cdirs" {
    type = list(string)
    description = "List of private subnet CDIRS"  
}

variable "azs" {
    type        = list(string)
    description = "Availability Zones"
    default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}