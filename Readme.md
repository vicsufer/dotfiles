# .Dotfiles

## Installation

```bash
stow --target=$HOME .
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Patch font icons

```bash
docker run --rm -e "PN=10" -v ~/Library/Fonts:/in:Z -v ~/Library/Fonts:/out:Z nerdfonts/patcher --complete
```
