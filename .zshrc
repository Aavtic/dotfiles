# ~/.zshrc file for zsh non-login shells.
# see /usr/share/doc/zsh/examples/zshrc for examples
#
#
#
# AWS
export AWS_ACCESS_KEY_ID=key
export AWS_SECRET_ACCESS_KEY=key
export AWS_REGION=us-east-2

# Exports
#

# installations on /usr/local
export PATH=$PATH:/usr/local/go/bin

# My aliases


alias longrangezip="tar cvf $lrzdir.tar $lrzdir; lrzip -Ubvvp `nproc` -S .bzip2-lrz -L 9 $lrzdir.tar; rm -fv $lrzdir.tar; unset lrzdir"
alias longrangeunzip="lrunzip -cdivvp `nproc` -d -o \$lrzdir.tar \$lrzdir.tar.bzip2-lrz; tar xvf \$lrzdir.tar; rm -vf \$lrzdir.tar;unset lrzdir"
alias nvimconf="nvim ~/.config/nvim"

alias fucking=sudo
alias open=xdg-open
alias restartwaybar="pkill waybar && nohup waybar&"
alias prev="fzf --preview \"cat {}\""
# alias pine_parser="./target/debug/parser_test"
alias pine_install="/usr/local/pine"


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


# 1. Load vcs_info for git branch display
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '─(%F{magenta}%b%F{blue})'
setopt PROMPT_SUBST

# 2. Run vcs_info before every command
precmd() { vcs_info }

# 3. Your Prompt
# I added $'\n' at the start to force a new line before the prompt renders.
PROMPT=$'\n%F{blue}┌─[%F{red}%n@%m%F{blue}] [%F{yellow}%~%F{blue}]
└${vcs_info_msg_0_}─%F{cyan}$ %F{reset}'


# === Prompt ===
# PROMPT="%F{blue}┌─[%F{red}%n@%m%F{blue}] [%F{yellow}%~%F{blue}]
# └─%F{cyan}$ %F{reset}"


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
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/share/nvm/init-nvm.sh" ] && source /usr/share/nvm/init-nvm.sh


# android flutter
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME

export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/build-tools

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
