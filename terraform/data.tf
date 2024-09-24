data "digitalocean_droplet_snapshot" "eastblue" {
  name        = var.droplet_snapshot_name
  region      = var.droplet_region
  most_recent = true
}
