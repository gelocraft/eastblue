packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.4"
      source  = "github.com/digitalocean/digitalocean"
    }
  }
}

source "digitalocean" "eastblue" {
  image         = "ubuntu-24-04-x64"
  snapshot_name = "eastblue-linux"
  size          = "s-1vcpu-1gb"
  region        = "sgp1"
  ssh_username  = "root"
}

build {
  sources = ["source.digitalocean.eastblue"]
  provisioner "shell" {
    inline = [
      "apt update -y && apt upgrade -y",
      "apt install -y zsh neovim eza fzf ripgrep fd-find bat git-delta gcc tar unzip curl wget neofetch",
      "useradd --create-home --groups sudo --shell /usr/bin/zsh geloman",
      "mkdir -p /home/geloman/{.config,.personal,.development}",
      "git clone --depth 1 https://github.com/geloman-likes-rust/dotfiles /home/geloman/.dotfiles",
      "git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /home/geloman/.oh-my-zsh",
      "ln /home/geloman/.dotfiles/zsh/.zshrc /home/geloman/.zshrc",
      "ln /home/geloman/.dotfiles/nvim /home/geloman/.config/",
      "ln /home/geloman/.dotfiles/tmux/.tmux.conf /home/geloman/.tmux.conf"
    ]
  }
}
