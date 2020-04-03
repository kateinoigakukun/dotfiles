function __ghq_cd_repository() {
    local repo=$(ghq list | peco)
    cd $(ghq root)/$repo
}

alias sd=__ghq_cd_repository
