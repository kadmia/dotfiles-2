PROMPT='%m %{${fg_bold[blue]}%}:: %{$reset_color%}%{${fg[green]}%}%3~ $(git_prompt_info)%{${fg_bold[blue]}%}//%{$reset_color%} %{${fg_bold[cyan]}%}‹${DOCKER_HOST:-local}›%{$reset_color%} %{${fg_bold[$CARETCOLOR]}%}»%{${reset_color}%} '
export GPG_TTY=$(tty)
