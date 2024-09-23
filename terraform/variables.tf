variable "droplet_name" {
  description = "digitalocean droplet name"
  type        = string
}

variable "droplet_image" {
  description = "digitalocean droplet machine image"
  type        = string
}

variable "droplet_size" {
  description = "digitalocean droplet size"
  type        = string
}

variable "droplet_region" {
  description = "digitalocean droplet region"
  type        = string
}

variable "droplet_ssh_keys" {
  description = "digitalocean droplet ssh key fingerprints"
  type        = list(string)
}

variable "do_token" {
  description = "digitalocean api access key"
  type        = string
  sensitive   = true
}
