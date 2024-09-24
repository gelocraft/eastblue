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
      "apt install -y zsh eza fzf ripgrep fd-find bat git-delta gcc tar unzip curl wget neofetch",
      "useradd --create-home --groups sudo --shell /usr/bin/zsh geloman && passwd --delete geloman",
      "mkdir -p /home/geloman/.config /home/geloman/.personal /home/geloman/.development",
      "git clone --depth 1 https://github.com/geloman-likes-rust/dotfiles /home/geloman/.dotfiles",
      "git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /home/geloman/.oh-my-zsh",
      "git clone --depth 1 https://github.com/tmux-plugins/tpm /home/geloman/.tmux/plugins/tpm",
      "ln -s /home/geloman/.dotfiles/.gitconfig /home/geloman/.gitconfig",
      "ln -s /home/geloman/.dotfiles/zsh/.zshrc /home/geloman/.zshrc",
      "ln -s /home/geloman/.dotfiles/nvim /home/geloman/.config/",
      "ln -s /home/geloman/.dotfiles/tmux/.tmux.conf /home/geloman/.tmux.conf",
      "su geloman -c \"cd /home/geloman && curl -s -JLO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz\"",
      "su geloman -c \"cd /home/geloman && tar xzf nvim-linux64.tar.gz && rm -rdf nvim-linux64.tar.gz && mkdir -p /home/geloman/.local/bin\"",
      "su geloman -c \"cd /home/geloman && mv nvim-linux64/bin/nvim /home/geloman/.local/bin/nvim && rm -rdf nvim-linux64\"",
      "su geloman -c \"/home/geloman/.local/bin/nvim --headless '+Lazy! restore' +qa\"",
      "chown -R geloman:geloman /home/geloman"
    ]
  }
}
