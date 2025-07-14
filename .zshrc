# ~/.zshrc file for zsh non-login shells.
# see /usr/share/doc/zsh/examples/zshrc for examples
#

# Exports
#

# installations on /usr/local
export PATH=$PATH:/usr/local/go/bin

# My aliases

alias longrangezip="tar cvf $lrzdir.tar $lrzdir; lrzip -Ubvvp `nproc` -S .bzip2-lrz -L 9 $lrzdir.tar; rm -fv $lrzdir.tar; unset lrzdir"
alias longrangeunzip="lrunzip -cdivvp `nproc` -d -o \$lrzdir.tar \$lrzdir.tar.bzip2-lrz; tar xvf \$lrzdir.tar; rm -vf \$lrzdir.tar;unset lrzdir"
alias nvimconf="nvim ~/.config/nvim"


alias open=xdg-open


#

# My settings
# bindkey "^[[1;5C" forward-word
# bindkey "^[[1;5D" backward-word


bindkey "^[[C" forward-char
bindkey "^[[D" backward-char

# Enable Ctrl + Arrow keys navigation
autoload -U select-word-style
select-word-style bash

# Bind Ctrl + Left and Ctrl + Right
bindkey '\e[1;5C' forward-word   # Ctrl + Right
bindkey '\e[1;5D' backward-word  # Ctrl + Left
bindkey '\e[5C' forward-word     # Sometimes needed
bindkey '\e[5D' backward-word
bindkey '\e[1;3C' forward-word   # Alt + Right fallback
bindkey '\e[1;3D' backward-word  # Alt + Left fallback


# ~/.zshrc file for zsh non-login shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples

setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# Add newline after each command
precmd() { print "" }


# === Basic settings ===
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history

# === Prompt ===
PROMPT="%F{blue}┌─[%F{red}%n@%m%F{blue}] [%F{yellow}%~%F{blue}]
└─%F{cyan}$ %F{reset}"


# === Emoji Prompt Indicator ===
RPROMPT="%? %F{red}"

# === Enable completion ===
autoload -Uz compinit
compinit

# === Enable syntax highlighting (optional) ===
if command -v zsh-syntax-highlighting &>/dev/null; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# === Add local bin to PATH ===
export PATH=$HOME/.local/bin:$PATH

export PATH="$HOME/.npm-global/bin:$PATH"
