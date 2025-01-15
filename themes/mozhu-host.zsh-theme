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
PROMPT="[Host] %{$fg_bold[green]%}➜ \
%{$fg[magenta]%}%n%{$fg[white]%}@%{$fg[magenta]%}%m \
$fg_bold[cyan]%}%~%{$reset_color%} \
%{$fg_bold[yellow]%}%D{%Y-%m-%d %H:%M:%S} \
%(?,,%{$fg[red]%}LEC:%?) \

%{$fg_bold[red]%}%# %{$reset_color%}"
