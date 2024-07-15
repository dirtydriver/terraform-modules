resource "tls_private_key" "priv_key" {
  algorithm = var.public_key_algorithm
  rsa_bits = var.public_key_algorithm == "RSA" ? var.bits_of_algorithm : null
  ecdsa_curve = var.public_key_algorithm == "ECDSA" ? var.ecdsa_curve : null
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.priv_key.public_key_openssh
}

resource "local_sensitive_file" "private_key" {
  content  = tls_private_key.priv_key.private_key_pem
  filename = "${path.module}/aws-key-pair.pem"
}