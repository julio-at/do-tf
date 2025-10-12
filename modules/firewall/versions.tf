# [Provider en módulo] Declara el origen correcto del provider para este módulo.
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

