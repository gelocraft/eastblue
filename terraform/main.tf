provider "digitalocean" {}

locals {
  droplet_snapshot = data.digitalocean_droplet_snapshot.eastblue.id
}

resource "digitalocean_droplet" "droplet" {
  image    = local.droplet_snapshot
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = var.droplet_ssh_keys
}
