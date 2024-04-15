# Hugo Parada's dotfiles
---

NeoVim config by **![Fib](https://github.com/NoahPsight/.dotfiles)**, zsh config by **![Gui Freitas](https://github.com/GJaFreitas/dotfiles)** with some mods done by me.

Thanks to both ![Fib](https://github.com/NoahPsight) and ![](https://github.com/GJaFreitas)

---

> Shown to work on both Ubuntu 22.04 and Arch.

---

## Install guide

### On Arch

```sh
sudo pacman -Syu
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/HugoParada19/dotfiles
```

### On Ubuntu

```sh
sudo apt update
sudo apt upgrade
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/HugoParada19/dotfiles
```

### After that

**In the same folder**

```sh
cp -r ./.oh-my-zsh ~/ && cp ./zshrc ~/ && cp -r ./.config ~/
```

# GL HF
