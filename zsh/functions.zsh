function llc() {
    ls -1 "$@" | wc -l
}

function wip() {
    git add .
    git commit -m "WIP $*"
}

function res() {
    local branch
    case $1 in
        m) branch=${$(git rev-parse --abbrev-ref origin/HEAD)#origin/} ;;
        p) branch=production ;;
        s) branch=staging ;;
        '') print -u2 'usage: res m|p|s|<branch>'; return 1 ;;
        *) branch=$1 ;;
    esac

    git fetch origin "$branch"
    if [[ $(git rev-parse --abbrev-ref HEAD) == "$branch" ]]; then
        git reset --hard "origin/$branch"
    else
        git branch -f "$branch" "origin/$branch"
    fi
}

function csql() {
    git add db/structure.sql
    git commit -m "structure.sql"
}

function rsql() {
    git checkout "${$(git rev-parse --abbrev-ref origin/HEAD)#origin/}" -- db/structure.sql
}
