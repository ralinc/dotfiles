function llc() {
    ls -1 "$@" | wc -l
}

function wip() {
    git add .
    git commit -m "WIP $*"
}

function res() {
    case $1 in
        m)
            if git ls-remote --heads origin main | grep -q 'refs/heads/main$' &> /dev/null; then
                BRANCH="main"
            else
                BRANCH="master"
            fi
            ;;
        p)
            BRANCH="production"
            ;;
        s)
            BRANCH="staging"
            ;;
        *)
            BRANCH=$1
            ;;
    esac

    git fetch
    git checkout $BRANCH
    git reset --hard origin/$BRANCH
    git checkout -
}

function csql() {
    git add db/structure.sql
    git commit -m "structure.sql"
}

function rsql() {
    git checkout master -- db/structure.sql
}
