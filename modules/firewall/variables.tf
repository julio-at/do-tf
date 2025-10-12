# [Variable de entrada] Etiqueta de entorno (dev/stg/prod)
variable "env" {
  description = "Environment label used in firewall naming"
  type        = string
}

# [Variable de entrada] ID del Droplet objetivo
variable "droplet_id" {
  description = "Droplet ID to attach firewall rules to"
  type        = string
}

# [Variable de entrada] CIDR permitido para SSH
variable "ssh_cidr" {
  description = "CIDR allowed to SSH into the Droplet (e.g., 203.0.113.4/32)"
  type        = string
}

