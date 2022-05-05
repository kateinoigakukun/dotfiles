function __ghq_cd_repository() {
    local repo=$(ghq list | fzf)
    if [ -n "$repo" ]; then
        echo $repo
        cd $(ghq root)/$repo
    fi
}

alias ghq-cd=__ghq_cd_repository
