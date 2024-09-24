provider "digitalocean" {}

resource "digitalocean_droplet" "droplet" {
  image     = var.droplet_image
  name      = var.droplet_name
  region    = var.droplet_region
  size      = var.droplet_size
  ssh_keys  = var.droplet_ssh_keys
  user_data = <<-EOF
  #!/bin/sh
  apt update -y && apt upgrade -y
  apt install -y zsh neovim eza fzf ripgrep fd-find bat git-delta gcc tar unzip curl wget neofetch

  useradd --create-home --groups sudo,docker --shell /usr/bin/zsh geloman
  mkdir -p /home/geloman/{.config,.personal,.development}

  git clone --depth 1 https://github.com/geloman-likes-rust/dotfiles /home/geloman/.dotfiles
  git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /home/geloman/.oh-my-zsh

  ln /home/geloman/.dotfiles/zsh/.zshrc /home/geloman/.zshrc
  ln /home/geloman/.dotfiles/nvim /home/geloman/.config/
  ln /home/geloman/.dotfiles/tmux/.tmux.conf /home/geloman/.tmux.conf

  nvim --headless "+Lazy! restore" +qa
  EOF
}
