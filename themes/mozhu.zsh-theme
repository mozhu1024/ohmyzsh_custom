# Git info
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}♆ (%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"

local git_info='$(git_prompt_info)'

# Prompt format:
# %n - username
# %m - machine
# %~ - current directory
# %D - date
# %? - last exit code
#
# ➜ USER@MACHINE DIRECTORY ♆ (BRANCH STATE) DATETIME LEC:LAST_EXIT_CODE
# $ COMMAND
#
PROMPT="%{$fg_bold[green]%}➜ \
%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[magenta]%}%m \
$fg_bold[cyan]%}%~%{$reset_color%} \
${git_info} \
%{$fg_bold[yellow]%}%D{%Y-%m-%d %H:%M:%S} \
%(?,,%{$fg[red]%}LEC:%?) \

%{$fg_bold[red]%}$ \
%{$reset_color%}"
