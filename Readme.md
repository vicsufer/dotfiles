```bash
    stow --target=$HOME .
```
# Patch font icons

```bash
docker run --rm -v ~/Library/Fonts:/in:Z -v ~/Library/Fonts:/out:Z nerdfonts/patcher
```
