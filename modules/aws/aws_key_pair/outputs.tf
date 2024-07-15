output "private_key_pem" {
  value     = var.put_priv_in_outputs ? tls_private_key.example.private_key_pem : null
  sensitive = true
}