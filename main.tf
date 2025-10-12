# [Data Source: SSH Key]
# Resuelve el ID de tu SSH key por nombre, para pasarlo al módulo droplet.
data "digitalocean_ssh_key" "default" {
  # [Nombre exacto de tu llave en DO]
  name = var.ssh_key_name
}

# [Módulo: VPC]
# Encapsula la red privada con su región y bloque CIDR.
module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
  region   = var.region
  vpc_cidr = var.vpc_cidr
}

# [Módulo: Droplet]
# Crea el servidor Ubuntu 24.04 en la VPC, con tags y cloud-init opcional.
module "droplet" {
  source       = "./modules/droplet"
  region       = var.region
  vpc_id       = module.vpc.vpc_id
  droplet_name = var.droplet_name
  droplet_size = var.droplet_size
  ssh_key_id   = data.digitalocean_ssh_key.default.id
  tags         = ["env:${var.env}", "role:web"]

  # [cloud-init]
  # Carga el YAML desde el root; si quieres omitirlo, pasa "".
  cloud_init   = file("${path.root}/cloud-init.yaml")
}

# [Módulo: Firewall]
# Aplica reglas mínimas: SSH restringido y HTTP/HTTPS abiertos.
module "firewall" {
  source     = "./modules/firewall"
  env        = var.env
  droplet_id = module.droplet.id
  ssh_cidr   = var.allowed_ssh_cidr
}

# [Outputs de conveniencia]
# IP pública del droplet y nombre de la VPC
output "droplet_public_ip" {
  description = "Droplet public IPv4 from module"
  value       = module.droplet.ipv4
}

output "vpc_name" {
  description = "Module VPC name"
  value       = module.vpc.vpc_name
}

