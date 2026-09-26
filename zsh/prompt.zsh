autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats '%F{031}%b%f'
zstyle ':vcs_info:git*' actionformats '%F{197}%b|%a%f'

function precmd {
    vcs_info
    _prompt_git=
    [[ -z $vcs_info_msg_0_ ]] && return

    local lines=("${(@f)$(git status --porcelain=v2 --branch 2> /dev/null)}")
    local symbol arrow

    if (( ${lines[(I)[12u] ?[^.]*]} )); then
        symbol='%F{197}✘%f'
    elif (( ${lines[(I)[12u] [^.]*]} )); then
        symbol='%F{222}S%f'
    elif (( ${lines[(I)\?*]} )); then
        symbol='%F{197}?%f'
    else
        symbol='%F{158}✔%f'
    fi

    if (( ${lines[(I)\# branch.ab * -[1-9]*]} )); then
        arrow=' %F{159}⇣%f'
    elif (( ${lines[(I)\# branch.ab +[1-9]*]} )); then
        arrow=' %F{159}⇡%f'
    fi

    _prompt_git=" $vcs_info_msg_0_ $symbol$arrow"
}

setopt prompt_subst

PROMPT='%F{146}%2~%f${_prompt_git} $ '
