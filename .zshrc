autoload colors
colors

case `hostname` in
    *)
      export LANG=ja_JP.utf-8
      export PROMPT_COLOR=${fg[cyan]};;
esac

export EDITOR=vim

PROMPT="%{$PROMPT_COLOR%}[%n@%m]%c%#%{${reset_color}%} "
#PROMPT="%{${fg[sky_blue]}%}[%n@%m]%c%#%{${reset_color}%} "
PROMPT2="%_>> "
RPROMPT="%{$PROMPT_COLOR%}%~%{${reset_color}%}"
SPROMPT="%R -> %r ? [n,y,a,e]"
zstyle ':completion:*' list-colors ''

setopt print_eight_bit
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep

bindkey -e #to Emacs key bind
bindkey "^?" backward-delete-char

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
setopt share_history
setopt hist_ignore_space

autoload -U compinit
compinit

setopt complete_aliases

alias ls="ls -h --color"
alias sl="ls"

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

source ~/perl5/perlbrew/etc/bashrc
