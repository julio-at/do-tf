# [Output] ID de la VPC creada (para conectar otros recursos)
output "vpc_id" {
  description = "ID of the created VPC"
  value       = digitalocean_vpc.this.id
}

# [Output] Nombre de la VPC (visible en el panel)
output "vpc_name" {
  description = "Name of the created VPC"
  value       = digitalocean_vpc.this.name
}

