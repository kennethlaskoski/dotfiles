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

# Prompt is '#' (for superuser)
# or ';' (for regular user),
# colored cyan if last exit ($?) ain't 0
export PS1='%(?..%F{cyan}%B)%(!.#.;)%b%f '

#     LSCOLORS            The value of this variable describes what color to use for which attribute when colors are enabled with CLICOLOR or COLORTERM.  This string is a concatenation of pairs of the format fb,
#                         where f is the foreground color and b is the background color.
#
#                         The color designators are as follows:
#
#                               a     black
#                               b     red
#                               c     green
#                               d     brown
#                               e     blue
#                               f     magenta
#                               g     cyan
#                               h     light grey
#                               A     bold black, usually shows up as dark grey
#                               B     bold red
#                               C     bold green
#                               D     bold brown, usually shows up as yellow
#                               E     bold blue
#                               F     bold magenta
#                               G     bold cyan
#                               H     bold light grey; looks like bright white
#                               x     default foreground or background
#
#                         Note that the above are standard ANSI colors.  The actual display may differ depending on the color capabilities of the terminal in use.
#
#                         The order of the attributes are as follows:
#
#                               1.   directory
#                               2.   symbolic link
#                               3.   socket
#                               4.   pipe
#                               5.   executable
#                               6.   block special
#                               7.   character special
#                               8.   executable with setuid bit set
#                               9.   executable with setgid bit set
#                               10.  directory writable to others, with sticky bit
#                               11.  directory writable to others, without sticky bit
#
#                         The default is "exfxcxdxbxegedabagacad", i.e., blue foreground and default background for regular directories, black foreground and red background for setuid executables, etc.
#
export LSCOLORS='gxfxcxdxbxEgEdhbhghchd'
export CLICOLOR=1

export LANG="en_US.UTF-8"

ssh-add --apple-load-keychain -q

# Homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /opt/homebrew/bin/fortune ] && { echo; /opt/homebrew/bin/fortune; echo; }
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh

[ -f /usr/local/kubectl ] && source <(/usr/local/kubectl completion zsh)

# Modular
export MODULAR_HOME="/Users/kenneth/.modular"
export PATH="/Users/kenneth/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

export PATH="/Applications/CMake.app/Contents/bin":"$PATH"

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

# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

# Aliases
alias diff="diff -u --color"
alias dsk="diskutil"
alias lc="launchctl"
alias ppl="plutil -p"
alias sw="swift"
alias ="sw_vers"	# ⌥⇧K Option-Shift-K

setopt COMPLETE_ALIASES
