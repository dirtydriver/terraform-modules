output "private_key_pem" {
  value     = var.put_priv_in_outputs ? tls_private_key.priv_key.private_key_pem : null
  sensitive = true
}

output "key_name" {
  value = aws_key_pair.key_pair.key_name
}