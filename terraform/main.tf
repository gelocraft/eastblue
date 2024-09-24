provider "digitalocean" {}

resource "digitalocean_droplet" "droplet" {
  image     = var.droplet_image
  name      = var.droplet_name
  region    = var.droplet_region
  size      = var.droplet_size
  ssh_keys  = var.droplet_ssh_keys
  user_data = <<-EOT
    #!/bin/sh
    apt update -y && apt upgrade -y
    apt install -y zsh eza fzf ripgrep fd-find bat git-delta gcc tar unzip curl wget neofetch
    useradd --create-home --groups sudo,docker --shell /usr/bin/zsh geloman
    su geloman
    pwd && whoami
    mkdir -p ~/.config ~/.personal ~/.development
    git clone --depth 1 https://github.com/geloman-likes-rust/dotfiles ~/.dotfiles
    git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    ln ~/.dotfiles/zsh/.zshrc ~/.zshrc
    ln ~/.dotfiles/nvim ~/.config/
    ln ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
    nvim --headless "+Lazy! restore" +qa
    exit && reboot
  EOT
}
