# virzz 
if which virzz > /dev/null ; then
    if [[ -n $DEBUG ]]; then
        echo "Add virzz alias && completion"
    fi
    # add to alias
    source <(virzz alias)
    # completion
    PROG=virzz source <(virzz completion zsh)
elif which enyo > /dev/null ; then
    if [[ -n $DEBUG ]]; then
        echo "Add enyo alias && completion"
    fi
    # add to alias
    source <(enyo alias)
    # completion
    PROG=enyo source <(enyo completion zsh)
fi