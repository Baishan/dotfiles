#
# A stripped-down sorin theme.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Josh Symonds <josh@joshsymonds.com>
#
# Screenshots:
#   http://i.imgur.com/nBEEZ.png
#

# Load dependencies.
pmodload 'helper'

function prompt_josh_pwd {
  local pwd="${PWD/#$HOME/~}"

  if [[ "$pwd" == (#m)[/~] ]]; then
    _prompt_josh_pwd="$MATCH"
    unset MATCH
  else
    _prompt_josh_pwd="${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}/${pwd:t}"
  fi
}

function prompt_josh_precmd {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS

  # Format PWD.
  prompt_josh_pwd

  # Get Git repository information.
  if (( $+functions[git-info] )); then
    git-info
  fi

  # Get ruby information
  if (( $+functions[ruby-info] )); then
    ruby-info
  fi
}

function prompt_josh_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Load required functions.
  autoload -Uz add-zsh-hook

  # Add hook for calling git-info before each command.
  add-zsh-hook precmd prompt_josh_precmd

  # Set editor-info parameters.
  zstyle ':prezto:module:editor:info:completing' format '%B%F{red}...%f%b'
  zstyle ':prezto:module:editor:info:keymap:primary' format '%B%(?;%{%F{green}%} ;%{%F{red}%} )❯%f%b'
  zstyle ':prezto:module:editor:info:keymap:primary:overwrite' format ' %F{red}♺%f'
  zstyle ':prezto:module:editor:info:keymap:alternate' format ' %B%F{green}❮%F{yellow}❮%F{red}❮%f%b'

  # Set git-info parameters.
  zstyle ':prezto:module:git:info' verbose 'yes'
  zstyle ':prezto:module:git:info:action' format ':%%B%F{yellow}%s%f%%b'
  zstyle ':prezto:module:git:info:added' format ' %%B%F{green}✚%f%%b'
  zstyle ':prezto:module:git:info:ahead' format ' %%B%F{yellow}⬆%f%%b'
  zstyle ':prezto:module:git:info:behind' format ' %%B%F{yellow}⬇%f%%b'
  zstyle ':prezto:module:git:info:branch' format '%F{green}%b%f'
  zstyle ':prezto:module:git:info:commit' format ':%F{green}%.7c%f'
  zstyle ':prezto:module:git:info:deleted' format ' %%B%F{red}✖%f%%b'
  zstyle ':prezto:module:git:info:modified' format ' %%B%F{blue}✱%f%%b'
  zstyle ':prezto:module:git:info:position' format ':%F{red}%p%f'
  zstyle ':prezto:module:git:info:renamed' format ' %%B%F{magenta}➜%f%%b'
  zstyle ':prezto:module:git:info:stashed' format ' %%B%F{cyan}✭%f%%b'
  zstyle ':prezto:module:git:info:unmerged' format ' %%B%F{yellow}═%f%%b'
  zstyle ':prezto:module:git:info:untracked' format ' %%B%F{white}◼%f%%b'
  zstyle ':prezto:module:git:info:keys' format \
    'prompt' ' $(coalesce "%b" "%p" "%c")%s' \
    'rprompt' '%A%B%S%a%d%m%r%U%u'

  # Define prompts.
  PROMPT='%F{cyan}${_prompt_josh_pwd}%f${git_info:+${(e)git_info[prompt]}}%(!. %B%F{red}#%f%b.)${editor_info[keymap]} '
  RPROMPT='${editor_info[overwrite]}${VIM:+" %B%F{green}V%f%b"}${git_info[rprompt]}'
  SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
}

prompt_josh_setup "$@"

