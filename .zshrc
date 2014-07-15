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

# 日本語ファイル名を表示可能にする
setopt print_eight_bit
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
setopt correct
setopt list_packed
setopt noautoremoveslash
setopt nolistbeep
# beep を無効にする
setopt no_beep
# = の後はパス名として補完する
setopt magic_equal_subst

bindkey -e #to Emacs key bind
bindkey "^?" backward-delete-char

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 補完候補が複数あるときに自動的に一覧表示する
setopt auto_menu
# 高機能なワイルドカード展開を使用する
setopt extended_glob

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward


########################################

autoload -U compinit
compinit

 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..


# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
 
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

setopt complete_aliases

alias sl="ls"

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias ack="ack-grep"

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '


########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls="ls -h --color"
        ;;
esac
