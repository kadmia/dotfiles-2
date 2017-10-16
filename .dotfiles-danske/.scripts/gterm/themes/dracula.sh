#!/usr/bin/env bash

PROFILE_NAME="dracula"
PROFILE_SLUG="67c236d8-e1a0-46af-9150-cf437986d33a"

COLOR_01="#44475a" # HOST
COLOR_02="#ff5555" # SYNTAX_STRING
COLOR_03="#50fa7b" # COMMAND
COLOR_04="#ffb86c" # COMMAND_COLOR2
COLOR_05="#8be9fd" # PATH
COLOR_06="#bd93f9" # SYNTAX_VAR
COLOR_07="#ff79c6" # PROMP
COLOR_08="#94A3A5" #

COLOR_09="#000000" #
COLOR_10="#ff5555" # COMMAND_ERROR
COLOR_11="#50fa7b" # EXEC
COLOR_12="#ffb86c" #
COLOR_13="#8be9fd" # FOLDER
COLOR_14="#bd93f9" #
COLOR_15="#ff79c6" #
COLOR_16="#ffffff" #

BACKGROUND_COLOR="#282a36"
FOREGROUND_COLOR="#94A3A5"

CURSOR_COLOR="$FOREGROUND_COLOR"

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../gterm-theme-apply.sh"
