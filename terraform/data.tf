data "digitalocean_droplet_snapshot" "eastblue" {
  name_regex  = "^${var.droplet_snapshot}"
  region      = var.droplet_region
  most_recent = true
}
