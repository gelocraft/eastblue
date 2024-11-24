provider "digitalocean" {}

resource "digitalocean_droplet" "droplet" {
  image    = try(data.digitalocean_droplet_snapshot.eastblue[0].id, var.droplet_image)
  name     = var.droplet_name
  region   = var.droplet_region
  size     = var.droplet_size
  ssh_keys = var.droplet_ssh_keys
}
