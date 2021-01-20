function check() {
  git add .
  git commit -m "WIP $*"
}

function gres() {
  git fetch
  git checkout $1
  git reset --hard origin/$1
  git checkout -
}

function csql() {
  git add db/structure.sql
  git commit -m "structure.sql"
}

function rsql() {
  git checkout master -- db/structure.sql
}
