# Installing

```
curl  -sSL https://git.io/polarmutex | bash
```

## Using

```
chezmoi init --apply --verbose git@github.com:polarmutex/dotfiles.git
```

## creating curl bash
Use git.io or your favorite shortener and point to the bootstrap/setup script in your dotfiles repo:
```
curl -i https://git.io -F "url=https://raw.githubusercontent.com/polarmutex/dotfiles/master/setup.sh" -F code=polarmutex
```

### How to disable the super key in ubuntu MATE 

```
gsettings set org.mate.mate-menu hot-key ''
gsettings set com.solus-project.brisk-menu hot-key ''
```

## Update chezmoi imports
```bash
cd $(chezmoi source-path)
./update-imports.sh
```
- Oh-My-Zsh
- lain (awesome)
- bling (awesome)
