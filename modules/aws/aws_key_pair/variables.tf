variable "put_priv_in_outputs" {
  description = "Boolean to determine if the private key should be output"
  type        = bool
  default     = false
}

variable "public_key_algorithm" {
 description = "Algorithm of public key"
 default = "RSA"
 type = string
}

variable "bits_of_algorithm" {
 description = "Bits of RSA key"
 default = 2048
 type = number
}

variable "ecdsa_curve" {
  description = "The curve to use for ECDSA keys"
  type        = string
  default     = "P256"
}