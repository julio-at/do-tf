# [Variable de entrada] Región del Droplet
variable "region" {
  description = "DigitalOcean region for the Droplet"
  type        = string
}

# [Variable de entrada] ID de la VPC donde se conectará
variable "vpc_id" {
  description = "VPC ID to attach the Droplet to"
  type        = string
}

# [Variable de entrada] Nombre/hostname del Droplet
variable "droplet_name" {
  description = "Droplet hostname"
  type        = string
}

# [Variable de entrada] Tamaño (slug) del Droplet
variable "droplet_size" {
  description = "Droplet size slug (e.g., s-1vcpu-1gb)"
  type        = string
}

# [Variable de entrada] ID de la SSH key existente en DO
variable "ssh_key_id" {
  description = "DigitalOcean SSH key ID to authorize access"
  type        = string
}

# [Variable de entrada] Tags del Droplet
variable "tags" {
  description = "Tags to assign to the Droplet"
  type        = list(string)
  default     = []
}

# [Variable de entrada] Contenido cloud-init (YAML) opcional
variable "cloud_init" {
  description = "Cloud-init user_data content; leave empty to disable"
  type        = string
  default     = ""
}

