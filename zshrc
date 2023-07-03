#  Copyright © 2023 Kenneth Laskoski.
#  SPDX-License-Identifier: Apache-2.0

#                  ╔═══════════╤═══════════╤═══════════╗
#                  ║  Scripts  │ Non-login │   Login   ║
#  ╔═══════════════╬═══════════╪═══════════╪═══════════╣
#  ║ /etc/zshenv   ║ █████████ │ █████████ │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ ~/.zshenv     ║ █████████ │ █████████ │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ /etc/zprofile ║           │           │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ ~/.zprofile   ║           │           │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ /etc/zshrc    ║           │ █████████ │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ ~/.zshrc      ║           │ █████████ │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ /etc/zlogin   ║           │           │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ ~/.zlogin     ║           │           │ █████████ ║
#  ╠═══════════════╬═══════════╪═══════════╪═══════════╣
#  ║ ~/.zlogout    ║           │           │ █████████ ║
#  ╟───────────────╫───────────┼───────────┼───────────╢
#  ║ /etc/zlogout  ║           │           │ █████████ ║
#  ╚═══════════════╩═══════════╧═══════════╧═══════════╝

export PS1='%(?..%F{cyan}%B)%(!.#.;)%b%f '

export CLICOLOR=1
export LSCOLORS='gxfxcxdxBxEgEdhbhghchd'

export LANG="en_US.UTF-8"

ssh-add --apple-load-keychain -q

# Homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh

source <(kubectl completion zsh)

# Aliases
# alias ="sw_vers"
alias dsk="diskutil"
alias ppl="plutil -p"
alias lc="launchctl"

alias sw="swift"

alias diff="diff -u --color"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

