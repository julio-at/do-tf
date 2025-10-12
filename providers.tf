# [Contexto general]
# Configura cómo Terraform se autentica y comunica con la API de DigitalOcean.

provider "digitalocean" {

  # [Autenticación]
  # Token personal de acceso (PAT) de DigitalOcean.
  # Se obtiene externamente (tfvars/CLI/ENV) y se pasa como variable segura.
  token = var.do_token

  # [Región por defecto] (Opcional)
  # Si no se define aquí, cada recurso puede especificar su región explícita.
  # Ejemplos: "nyc3", "sfo3", "fra1".
  # region = "nyc3"

  # [Endpoint de API] (Avanzado / opcional)
  # Útil para entornos privados/sandbox; por defecto usa el endpoint público.
  # api_url = "https://api.digitalocean.com/v2/"
}

