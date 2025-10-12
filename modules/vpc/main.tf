# [Recurso: VPC]
# Red privada que agrupa tus recursos; define región y bloque CIDR.
resource "digitalocean_vpc" "this" {
  # [Nombre legible de la VPC]
  name = var.vpc_name

  # [Región de la VPC]
  # Debe empatar con los recursos que conectes a esta red.
  region = var.region

  # [Rango CIDR de la VPC]
  # Evita solaparlo con tu LAN/VPN para facilitar peering/túneles.
  ip_range = var.vpc_cidr
}

