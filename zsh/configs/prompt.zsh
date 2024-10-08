# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git branch --show-current 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst

# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
  PS1='%{$fg_bold[blue]%}[devdsk]%c%{$reset_color%}$(git_prompt_info) %# '
fi
