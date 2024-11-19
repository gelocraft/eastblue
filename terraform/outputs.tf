output "droplet_ipv4_address" {
  value = digitalocean_droplet.droplet.ipv4_address
}

output "droplet_size" {
  value = try(digitalocean_droplet.droplet.size, "")
}
