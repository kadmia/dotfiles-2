PROMPT='%m %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[blue]}%}@%{$reset_color%} %{${fg_bold[red]}%}[$(ssh-add -L | sed "s/.*\///" | grep -v "The agent" | paste -sd "|" -)]%{$reset_color%} %{${fg_bold[yellow]}%}[${DOCKER_HOST}]%{$reset_color%} %{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
export GPG_TTY=$(tty)
