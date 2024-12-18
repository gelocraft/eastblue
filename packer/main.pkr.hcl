packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.4"
      source  = "github.com/digitalocean/digitalocean"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "digitalocean" "eastblue" {
  image         = "ubuntu-24-04-x64"
  snapshot_name = "eastblue-linux"
  size          = "s-1vcpu-1gb-amd"
  region        = "sgp1"
  ssh_username  = "root"
}

build {
  sources = ["source.digitalocean.eastblue"]
  provisioner "ansible" {
    playbook_file = "../ansible/playbook.yaml"
  }
}
