packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.4"
      source  = "github.com/digitalocean/digitalocean"
    }
  }
}

source "digitalocean" "eastblue" {
  image         = "ubuntu-22-04-x64"
  latest        = true
  snapshot_name = "eastblue-linux"
  size          = "s-1vcpu-1gb"
  region        = "sgp1"
  ssh_username  = "root"
}

build {
  sources = ["source.digitalocean.eastblue"]
  provisioner "shell" {
    script = "../setup"
  }
}
