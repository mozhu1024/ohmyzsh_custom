#!/usr/bin/env zsh
which zsh >/dev/null || exit 1
if [[ "$1" == "install" ||  "$1" == "i" ]]; then
    sed -i '2,11s/^/### /' $0
    mv $0 ~/.oh-my-zsh/custom/themes/$0
    test -f ~/.oh-my-zsh/custom/themes/$0 && echo "Theme $0 has been installed" || echo "Failed to install theme $0"
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="mozhu-host"/' ~/.zshrc
    grep -q "ZSH_THEME=\"mozhu-host\"" ~/.zshrc && echo "Theme has been set to $0" || echo "Failed to set theme to $0"
    echo "Apply the theme by running:\n\tsource ~/.zshrc"
    exit 0
fi

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
