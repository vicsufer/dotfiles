### Add z-shell
source <(curl -sL init.zshell.dev); zzinit
### End of z-shell installer chunk

if [[ -r "${XDG_CACHE_HOME:=${HOME}/.config}/zi.init.zsh" ]]; then
    source "${XDG_CACHE_HOME:=${HOME}/.config}/zi.init.zsh" && zzinit
fi 

# Theme setup
export POWERLEVEL10K_INSTANT_PROMPT=quiet
export POWERLEVEL10K_MODE="awesome-patched"
export POWERLEVEL10K_SHOW_CHANGESET=true
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor
zi ice if"[[ -d ${HOME}/.fonts/ttf ]] && [[ $OSTYPE = linux* ]]" \
  id-as"meslo" from"gh-r" bpick"Meslo.zip" extract nocompile depth"1" \
  atclone="rm -f *Windows*; mv -vf *.ttf ${HOME}/.fonts/ttf/; fc-cache -v -f" atpull"%atclone"
zi light ryanoasis/nerd-fonts
zi ice depth'1' atload"[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" nocd
zi light romkatv/powerlevel10k

# Programs
zi ice as'program' from'gh-r' pick'zoxide' \
  atclone'ln -s completions/_zoxide -> _zoxide;
  cp man/man1/*.1 $ZI[MAN_DIR]/man1; ./zoxide init zsh --cmd x > init.zsh' \
  atpull'%atclone' src'init.zsh' nocompile'!'
zi light ajeetdsouza/zoxide

zi ice as'program' from'gh-r' \
  bpick'nvim-macos.tar.gz' sbin'**/bin/nvim -> nvim'
zi light neovim/neovim

# Plugin 
zi ice wait lucid atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay"
zi light z-shell/F-Sy-H

zi ice wait lucid atload"!_zsh_autosuggest_start"
zi load zsh-users/zsh-autosuggestions

zi snippet OMZP::git
zi snippet OMZP::kubectl
zi snippet https://raw.githubusercontent.com/agkozak/zsh-z/master/zsh-z.plugin.zsh
zi snippet https://raw.githubusercontent.com/Dbz/kube-aliases/master/kube-aliases.plugin.zsh
zi snippet OMZP::docker

# Completionsp#
zi ice as"completion"
zi snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

zi ice lucid wait as'completion' blockf has'kubectx'
zi snippet https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/_kubectx.zsh 

zi ice lucid wait as'completion' blockf has'kubens'
zi snippet https://raw.githubusercontent.com/ahmetb/kubectx/master/completion/_kubens.zsh 

zi ice lucid wait as'completion' blockf has'alacritty'
zi snippet https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty

zi ice lucid wait as'completion' blockf mv'git-completion.zsh -> _git'
zi snippet https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh

zi ice wait lucid as'completion' blockf has'zoxide'
zi snippet https://github.com/ajeetdsouza/zoxide/blob/main/contrib/completions/_zoxide

zi ice lucid wait as'completion'
zi light zsh-users/zsh-completions

zi ice atinit"zicompinit; zicdreplay"

# Homebew
eval(brew shellenv)

# PATH
export GOPATH=$HOME/go
export PATH=$GOPATH:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=${KREW_ROOT:-HOME/.krew}/bin:$PATH

# Load private zshrc
[ -f "${HOME}/.config/zsh/init_private.zsh" ] && source "${HOME}/.config/zsh/init_private.zsh"
