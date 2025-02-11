provider "digitalocean" {}

resource "digitalocean_droplet" "droplet" {
  image    = data.digitalocean_droplet_snapshot.eastblue.id
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = [var.droplet_ssh_key]
}
