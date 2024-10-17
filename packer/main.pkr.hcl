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
  size          = "s-1vcpu-1gb-amd"
  region        = "sgp1"
  ssh_username  = "root"
}

build {
  sources = ["source.digitalocean.eastblue"]
  provisioner "shell" {
    inline = [
      "apt update -y && apt upgrade -y",
      "apt install -y zsh eza fzf ripgrep fd-find bat git-delta gcc tar unzip curl wget neofetch ansible",
      "useradd --create-home --groups sudo --shell /usr/bin/zsh geloman && passwd --delete geloman",
      "mkdir -p /home/geloman/.ssh /home/geloman/.config /home/geloman/.personal /home/geloman/.development /home/geloman/.language-servers/bin /home/geloman/.language-servers/lua-language-server",
      "git clone --depth 1 https://github.com/geloman-likes-rust/dotfiles /home/geloman/.dotfiles",
      "git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git /home/geloman/.oh-my-zsh",
      "git clone --depth 1 https://github.com/tmux-plugins/tpm /home/geloman/.tmux/plugins/tpm",
      "[ ! -f /usr/bin/bat ] && ln -s /usr/bin/batcat /usr/bin/bat",
      "curl -L https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | tar xz -C /usr/local/",
      "curl -L https://github.com/LuaLS/lua-language-server/releases/download/3.10.6/lua-language-server-3.10.6-linux-x64.tar.gz | tar xz -C /home/geloman/.language-servers/lua-language-server",
      "ln -s /usr/local/nvim-linux64/bin/nvim /usr/local/bin/nvim",
      "ln -s /home/geloman/.language-servers/lua-language-server/bin/lua-language-server /home/geloman/.language-servers/bin/lua-language-server",
      "ln -s /home/geloman/.dotfiles/ssh/config /home/geloman/.ssh/config",
      "ln -s /home/geloman/.dotfiles/.gitconfig /home/geloman/.gitconfig",
      "ln -s /home/geloman/.dotfiles/zsh/.zshrc /home/geloman/.zshrc",
      "ln -s /home/geloman/.dotfiles/nvim /home/geloman/.config/",
      "ln -s /home/geloman/.dotfiles/tmux/.tmux.conf /home/geloman/.tmux.conf",
      "chown -R geloman:geloman /home/geloman",
      "su geloman -c \"nvim --headless '+Lazy! restore' +qa\""
    ]
  }
}
