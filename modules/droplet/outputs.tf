# [Output] ID del Droplet (para asociarlo a firewall, etc.)
output "id" {
  description = "Droplet ID"
  value       = digitalocean_droplet.this.id
}

# [Output] IPv4 pública del Droplet
output "ipv4" {
  description = "Droplet public IPv4"
  value       = digitalocean_droplet.this.ipv4_address
}

