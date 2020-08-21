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
