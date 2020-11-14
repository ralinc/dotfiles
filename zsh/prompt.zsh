typeset -AHg fg bg

for color in {000..255}; do
  fg[$color]="%{[38;5;${color}m%}"
  bg[$color]="%{[48;5;${color}m%}"
done

ZSH_SPECTRUM_TEXT="What a neat color this is"

spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$fg[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$bg[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

prompt_color() {
  [[ -n "$1" ]] && print "%{$fg[$2]%}$1%{$reset_color%}"
}

prompt_green()  { print "$(prompt_color "$1" 158)" }
prompt_magenta(){ print "$(prompt_color "$1" 218)" }
prompt_purple() { print "$(prompt_color "$1" 146)" }
prompt_red()    { print "$(prompt_color "$1" 197)" }
prompt_cyan()   { print "$(prompt_color "$1" 159)" }
prompt_blue()   { print "$(prompt_color "$1" 031)" }
prompt_yellow() { print "$(prompt_color "$1" 222)" }
prompt_spaced() { [[ -n "$1" ]] && print " $@" }

prompt_shortened_path() { print "$(prompt_purple "%2~")" }

autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats $(prompt_blue "%b")
zstyle ':vcs_info:git*' actionformats $(prompt_red "%b|%a")

prompt_git_status_symbol(){
  local letter
  local checkmark="\u2714"
  local x_mark="\u2718"

  case $(prompt_git_status) in
    changed) letter=$(prompt_red $x_mark);;
    staged) letter=$(prompt_yellow "S");;
    untracked) letter=$(prompt_red "?");;
    unchanged) letter=$(prompt_green $checkmark);;
  esac

  prompt_spaced "$letter"
}

prompt_git_relative_branch_status_symbol(){
  local arrow;

  local downwards_arrow="\u21e3"
  local upwards_arrow="\u21e1"
  case $(prompt_git_relative_branch_status) in
    behind) arrow=$(prompt_cyan $downwards_arrow);;
    ahead) arrow=$(prompt_cyan $upwards_arrow);;
  esac

  print -n "$arrow"
}

prompt_git_status() {
  local git_status="$(cat "/tmp/git-status-$$")"
  if print "$git_status" | command grep -qF "Changes not staged" ; then
    print "changed"
  elif print "$git_status" | command grep -qF "Changes to be committed"; then
    print "staged"
  elif print "$git_status" | command grep -qF "Untracked files"; then
    print "untracked"
  elif print "$git_status" | command grep -qF "working directory clean"; then
    print "unchanged"
  fi
}

prompt_git_relative_branch_status(){
  local git_status="$(cat "/tmp/git-status-$$")"
  if print "$git_status" | command grep -qF "Your branch is behind"; then
    print "behind"
  elif print "$git_status" | command grep -qF "Your branch is ahead"; then
    print "ahead"
  fi
}

prompt_git_branch() {
  local colored_branch_name="$vcs_info_msg_0_"
  prompt_spaced "$colored_branch_name"
}

prompt_full_git_status(){
  if [[ -n "$vcs_info_msg_0_" ]]; then
    prompt_spaced $(prompt_git_branch) $(prompt_git_status_symbol) $(prompt_git_relative_branch_status_symbol)
  fi
}

function precmd {
  vcs_info
  git status 2> /dev/null >! "/tmp/git-status-$$"
}

setopt prompt_subst

PROMPT='$(prompt_shortened_path)$(prompt_full_git_status) $ '
