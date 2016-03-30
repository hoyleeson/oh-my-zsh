# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Mar 2013 Yad Smood

# VCS
HOY_VCS_PROMPT_PREFIX1=" %{$fg[white]%}(%{$reset_color%}"
HOY_VCS_PROMPT_PREFIX2=":%{$fg[white]%}"
HOY_VCS_PROMPT_SUFFIX="%{$reset_color%})"
HOY_VCS_PROMPT_DIRTY="%{$fg[red]%}x"
HOY_VCS_PROMPT_CLEAN="%{$fg[green]%}o"

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${HOY_VCS_PROMPT_PREFIX1}git${HOY_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$HOY_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$HOY_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$HOY_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(hoy_hg_prompt_info)'
hoy_hg_prompt_info() {
	# make sure this is a hg dir
	if [ -d '.hg' ]; then
		echo -n "${HOY_VCS_PROMPT_PREFIX1}hg${HOY_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$HOY_VCS_PROMPT_DIRTY"
		else
			echo -n "$HOY_VCS_PROMPT_CLEAN"
		fi
		echo -n "$HOY_VCS_PROMPT_SUFFIX"
	fi
}

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# Prompt format:
#
# PRIVILEGES USER @ MACHINE in DIRECTORY on git:BRANCH STATE [TIME] C:LAST_EXIT_CODE
# $ COMMAND
#
# For example:
#
# %hoy@hoy-mbp ~/.oh-my-zsh on git:master x [21:47:42] C:0
# $
PROMPT="
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[white]%}%n)\
%{$fg[white]%}@\
%{$fg[white]%}%m \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\
${git_info}\
%{$fg[white]%}\
%{$terminfo[bold]$fg[green]%}$ %{$reset_color%}"
