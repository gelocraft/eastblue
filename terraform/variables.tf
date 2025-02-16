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

variable "droplet_snapshot" {
  description = "the name of the droplet snapshot"
  type        = string
}

variable "droplet_region" {
  description = "digitalocean droplet region"
  type        = string
}

variable "droplet_ssh_key" {
  description = "digitalocean droplet ssh key fingerprint"
  type        = string
}
