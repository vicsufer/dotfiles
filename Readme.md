# .Dotfiles

## Installation

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew bundle --file brew/Brewfile
stow --target=$HOME .
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Patch font icons

```bash
docker run --rm -e "PN=10" -v ~/Library/Fonts:/in:Z -v ~/Library/Fonts:/out:Z nerdfonts/patcher --complete
```
