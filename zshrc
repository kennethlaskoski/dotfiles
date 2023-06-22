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

# Homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Aliases
# alias ="sw_vers"
alias dsk="diskutil"
alias ppl="plutil -p"
alias lc="launchctl"

alias sw="swift"

alias diff="diff -u --color"
