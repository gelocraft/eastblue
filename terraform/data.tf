data "digitalocean_droplet_snapshot" "eastblue" {
  count       = var.use_droplet_snapshot ? 0 : 1
  name_regex  = "^${var.droplet_snapshot}"
  region      = var.droplet_region
  most_recent = true
}
