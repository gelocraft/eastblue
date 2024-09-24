provider "digitalocean" {}

resource "digitalocean_droplet" "droplet" {
  image    = var.droplet_snapshot
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = var.droplet_ssh_keys
}
