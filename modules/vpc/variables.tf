# [Variable de entrada] Nombre legible para la VPC
variable "vpc_name" {
  description = "Name for the VPC"
  type        = string
}

# [Variable de entrada] Región DigitalOcean (nyc3, sfo3, fra1, etc.)
variable "region" {
  description = "DigitalOcean region for the VPC"
  type        = string
}

# [Variable de entrada] Bloque CIDR (ej. 10.10.0.0/16)
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

