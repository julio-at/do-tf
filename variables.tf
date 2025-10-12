# [Contexto general]
# Define las variables de entrada del proyecto para parametrizar y proteger credenciales.

# [Variable: do_token]
# Token personal de acceso (PAT) para autenticar el provider de DigitalOcean.
variable "do_token" {
  description = "DigitalOcean Personal Access Token (PAT) with read/write scopes."
  type = string
  sensitive = true
}

# [Variable: env]
# Etiqueta de entorno para nombres/tags (ej. dev, stg, prod).
variable "env" {
  description = "Environment label used for naming and tagging"
  type        = string
  default     = "dev"
}

# [Variable: region]
# Región donde crear recursos (debe existir en DO: nyc3, sfo3, fra1, etc.)
variable "region" {
  description = "DigitalOcean region for all resources"
  type        = string
  default     = "nyc3"
}

# [Variable: vpc_name]
# Nombre legible para la VPC (aparece en el panel DO).
variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
  default     = "dev-vpc"
}

# [Variable: vpc_cidr]
# Rango privado de la VPC; evita solaparlo con tu LAN/VPN.
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

# [Variable: droplet_name]
# Nombre del Droplet (hostname visible en DO).
variable "droplet_name" {
  description = "Droplet hostname"
  type        = string
  default     = "dev-web-1"
}

# [Variable: droplet_size]
# Flavor/tamaño del Droplet (costo/recursos).
variable "droplet_size" {
  description = "Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

# [Variable: ssh_key_name]
# Nombre exacto de tu SSH key en DigitalOcean (no el fingerprint, el nombre).
variable "ssh_key_name" {
  description = "Existing DigitalOcean SSH key name to inject into the Droplet"
  type        = string
}

# [Variable: allowed_ssh_cidr]
# Desde dónde permites SSH al Droplet (mejor tu IP pública /32).
variable "allowed_ssh_cidr" {
  description = "CIDR allowed to SSH into the Droplet"
  type        = string
  default     = "0.0.0.0/0" # Cambia a tu IP: ej. "203.0.113.45/32"
}


