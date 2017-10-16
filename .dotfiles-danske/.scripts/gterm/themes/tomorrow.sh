#!/usr/bin/env bash

PROFILE_NAME="tomorrow"
PROFILE_SLUG="53b6f3a5-81fd-4758-8770-11085535a8cc"

COLOR_01="#000000" # HOST
COLOR_02="#C82828" # SYNTAX_STRING
COLOR_03="#718C00" # COMMAND
COLOR_04="#EAB700" # COMMAND_COLOR2
COLOR_05="#4171AE" # PATH
COLOR_06="#8959A8" # SYNTAX_VAR
COLOR_07="#3E999F" # PROMP
COLOR_08="#FFFEFE" #

COLOR_09="#000000" #
COLOR_10="#C82828" # COMMAND_ERROR
COLOR_11="#708B00" # EXEC
COLOR_12="#E9B600" #
COLOR_13="#4170AE" # FOLDER
COLOR_14="#8958A7" #
COLOR_15="#3D999F" #
COLOR_16="#FFFEFE" #

BACKGROUND_COLOR="#FFFFFF"
FOREGROUND_COLOR="#4D4D4C"

CURSOR_COLOR="#4C4C4C"

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../gterm-theme-apply.sh"
