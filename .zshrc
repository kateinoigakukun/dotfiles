autoload -U compinit; compinit
setopt auto_list
setopt auto_menu
setopt auto_cd
setopt auto_pushd
setopt hist_ignore_dups
setopt extended_history
setopt no_beep
setopt correct 
export HISTSIZE=1000
export SAVEHIST=100000


# env
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

if [ ! -d $ZPLUG_HOME ]; then
    git clone https://github.com/b4b4r07/zplug.git $ZPLUG_HOME
fi
source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'caiogondim/bullet-train-oh-my-zsh-theme', use:'bullet-train.zsh-theme'
zplug 'docker/cli', use:'contrib/completion/zsh/_docker'
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
    kill "$(ps -ax|sed -e '1d'|peco|awk '{ print $1 }')"
}


function select-attach-tmux() {
    if [ -n "$TMUX" ]; then
        return
    fi
    sessions=$(tmux list-sessions | awk '{ 
        id = substr($1,1,length($1)-1);
        "tmux display-message -p -F \"#{pane_current_path}\" -t" id ":0"|getline pwd;
        print id ": " pwd
    }')
    if [ -z $sessions ]; then
        exec tmux
        return
    fi
    session=$(echo "$sessions\nnew" | peco --prompt "tmux session >" | cut -d: -f1)
    if [ -z $session ]; then
        return
    fi
    if [ $session = new ]; then
        exec tmux
        return
    fi
    exec tmux attach-session -t $session
}

function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}
function zshexit() {
    ps -ax|grep peco|grep -v grep|awk '{ print $1 }'|xargs kill
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

zle -N zle-line-init
zle -N zle-keymap-select
zle -N peco-select-history
zle -N peco-kill
zle -N select-attach-tmux
bindkey -v
bindkey -a '^t' select-attach-tmux
bindkey '^t' select-attach-tmux
bindkey -a '^r' peco-select-history
bindkey '^r' peco-select-history
bindkey -a '^k' peco-kill
bindkey '^k' peco-kill
bindkey "^?" backward-delete-char

alias g='cd $(ghq root)/$(ghq list | peco)'
alias gbundle='BUNDLE_GEMFILE=$HOME/dotfiles/Gemfile bundle'

select-attach-tmux
