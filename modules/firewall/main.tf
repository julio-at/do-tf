# [Recurso: Firewall]
# Reglas básicas: SSH restringido, HTTP/HTTPS abiertos, egress permitido.
resource "digitalocean_firewall" "this" {
  # [Nombre del firewall]
  name = "${var.env}-basic-fw"

  # [Asociación] Aplica al Droplet por ID
  droplet_ids = [var.droplet_id]

  # [Inbound] SSH solo desde el CIDR permitido
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = [var.ssh_cidr]
  }

  # [Inbound] HTTP abierto
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # [Inbound] HTTPS abierto
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  # [Outbound] Permitir todo (tcp/udp)
  outbound_rule {
    protocol              = "tcp"
    port_range            = "0"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "0"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

