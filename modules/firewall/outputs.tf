# [Output] ID del firewall (por si deseas referenciarlo)
output "id" {
  description = "Firewall ID"
  value       = digitalocean_firewall.this.id
}

