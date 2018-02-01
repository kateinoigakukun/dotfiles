autoload -U compinit; compinit
setopt auto_list
setopt auto_menu
setopt auto_cd
setopt auto_pushd
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt no_beep
setopt correct 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

if [ ! -d $ZPLUG_HOME ]; then
    git clone https://github.com/b4b4r07/zplug.git $ZPLUG_HOME
fi
source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'caiogondim/bullet-train-oh-my-zsh-theme', use:'bullet-train.zsh-theme'
zplug 'zsh-users/zsh-completions'
zplug "felixr/docker-zsh-completion"
zplug "b4b4r07/enhancd", use:init.sh
zplug "Tarrasch/zsh-bd", use:bd.zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

BULLETTRAIN_PROMPT_ORDER=(
  time
  dir
  git
)

function zle-line-init zle-keymap-select {
    VIM_NORMAL="%K{208}%F{black}%k%f%K{208}%F{white} % [N] %k%f%K{black}%F{208}%k%f"
    VIM_INSERT="%K{075}%F{black}%k%f%K{075}%F{white} % [I] %k%f%K{black}%F{075}%k%f"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    RPS2=$RPS1
    zle reset-prompt
}

function peco-select-history() {
    tac="tail -r"

    BUFFER=$(\history -n 1 | uniq | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
}

function peco-kill() {
    kill "$(ps -a|sed -e '1d'|peco|awk '{ print $1 }')"
}


function select-attach-tmux() {
    ID="`tmux list-sessions`"
    if [ -z "$ID" ]; then
        tmux
    fi
    ID="`echo $ID | peco | cut -d: -f1`"
    if [ -z "$ID" ]; then
        return
    fi
    BUFFER="tmux attach-session -t $ID"
    zle accept-line
}


function attach-tmux() {
    if [ -n "$TMUX" ]; then
        return
    fi
    echo "Do you want to attach tmux session? (Y/n)"
    read ANSWER
    case $ANSWER in
        "" | "Y" | "y" | "yes" | "Yes" | "YES" )
            echo "attach the session."
            select-attach-tmux;;
        * ) echo "";;
    esac
}

function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

zle -N zle-line-init
zle -N zle-keymap-select
zle -N peco-select-history
zle -N peco-kill
zle -N select-attach-tmux
bindkey -v
bindkey '^t' select-attach-tmux
bindkey '^r' peco-select-history
bindkey '^k' peco-kill
