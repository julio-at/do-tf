# [Recurso: Droplet]
# Máquina virtual Ubuntu 24.04, asociada a la VPC, con tags y cloud-init opcional.
resource "digitalocean_droplet" "this" {
  # [Nombre del Droplet]
  name = var.droplet_name

  # [Región del Droplet]
  region = var.region

  # [Tamaño/Flavor del Droplet]
  size = var.droplet_size

  # [Imagen del SO] Ubuntu 24.04 (slug oficial)
  image = "ubuntu-24-04-x64"

  # [VPC] Asocia el Droplet a la red creada externamente
  vpc_uuid = var.vpc_id

  # [SSH key] Inyecta la key existente (por ID)
  ssh_keys = [var.ssh_key_id]

  # [Tags] Organización/filtrado en panel y reglas
  tags = var.tags

  # [cloud-init / user_data]
  # Si recibimos contenido no vacío, lo aplicamos; si viene "", se omite.
  user_data = var.cloud_init != "" ? var.cloud_init : null
}

