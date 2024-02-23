```bash
    stow --target=$HOME .
```
# Patch font icons

```bash
docker run --rm -e "PN=10" -v ~/Library/Fonts:/in:Z -v ~/Library/Fonts:/out:Z nerdfonts/patcher --complete
```
