#!/bin/sh

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# zmodload zsh/zprof
eval "$(fnm env --use-on-cd)"

# imports
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/plugins.zsh"

bindkey '^ ' autosuggest-accept


# Load Angular CLI autocompletion.
# source <(ng completion script)


# Caching zsh compinit for better performance
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# ===== i3 stuff =====
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
export XDG_RUNTIME_DIR=/tmp/xdg
export RUNLEVEL=3
# ===== fix mkdir wrong perms =====
if grep -q Microsoft /proc/version; then
  if [ "0022" == '0000' ]; then
    umask 0022
  fi
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mcli mcli
# zprof
