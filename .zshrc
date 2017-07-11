export TERM="xterm-256color"
export EDITOR=/usr/local/bin/vim
#キーバインドをviモードに
bindkey -v
#補完機能を有効にする
autoload -U compinit; compinit
#補完一覧を表示
setopt auto_list
#補完キー連打で次の候補へ
setopt auto_menu
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#cdの入力を省略
setopt auto_cd
#ディレクトリストックに追加する
setopt auto_pushd
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 重複を記録しない
setopt hist_ignore_dups
# 開始と終了を記録
setopt EXTENDED_HISTORY
#ビープ音を鳴らさない
setopt no_beep
#スペル訂正
setopt correct

ZSH_HIGHLIGHT_MAXLENGTH=100

source ~/.zplug/init.zsh || { git clone https://github.com/b4b4r07/zplug.git ~/.zplug && source ~/.zplug/init.zsh }

source ~/.git.zsh
export XDG_CONFIG_HOME=$HOME/.config
zplug 'b4b4r07/zplug', at:v2
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'
zplug 'caiogondim/bullet-train-oh-my-zsh-theme', use:'bullet-train.zsh-theme'
zplug 'zsh-users/zsh-completions'
zplug "felixr/docker-zsh-completion"
BULLETTRAIN_PROMPT_ORDER=(
  time
  dir
  ruby
  git
)
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

  # Then, source plugins and add commands to $PATH
zplug load --verbose

eval "$(rbenv init -)"

bindkey '^ ' autosuggest-accept
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history


function peco-kill() {
  kill "$(ps -a|sed -e '1d'|peco|awk '{ print $1 }')"
}

zle -N peco-kill
bindkey '^k' peco-kill

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

zle -N select-attach-tmux
bindkey '^t' select-attach-tmux

function attach-tmux() {
    if [ -n "$TMUX" ]; then
        return
    fi
    echo "Do you want to attaach tmux session? (Y/n)"
    read ANSWER
    case $ANSWER in
        "" | "Y" | "y" | "yes" | "Yes" | "YES" )
            echo "attach the session."
            select-attach-tmux;;
        * ) echo "";;
    esac
}

echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"
function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

attach-tmux
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi
alias rm=trash
alias vim=nvim
alias vi=nvim
export PATH="/usr/local/opt/libiconv/bin:$PATH"
