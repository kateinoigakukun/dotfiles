function __ghq_cd_repository() {
    local repo=$(ghq list | peco)
    if [ -n "$repo" ]; then
        echo $repo
        cd $(ghq root)/$repo
    fi
}

alias sd=__ghq_cd_repository
