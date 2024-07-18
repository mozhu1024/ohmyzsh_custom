MOZHU_PLUGIN_DIR=$(dirname $0)
############################
# Custom Function
############################
kubectl(){
    if [[ -z "$KUBECONFIG" ]];then
        echo "Please set KUBECONFIG"
        return
    fi
    command kubectl $@
}


sshl(){
    local n=$1
    if [[ -z "$n" ]]; then
        cat ~/.ssh/config | grep -A 2 "Host "
    else
        cat ~/.ssh/config | grep -A 2 "Host $n"
    fi
}

clearmac(){
    echo "Deleting .DS_Store ..."
    find . -name ".DS_Store" -delete
    echo "Deleting __MACOSX ..."
    find . -type d -name "__MACOSX" -exec rm -rf {} \;
    echo "Successfully"
}

clearnpm(){
    echo "Deleting node_modules ..."
    find . -type d -name "node_modules" -exec rm -rf {} \;
    echo "Successfully"
}

ss() { . $MOZHU_PLUGIN_DIR/libs/ss.zsh $1 }
initjava() { . $MOZHU_PLUGIN_DIR/libs/initjava.zsh $1 }
sshkey() { . $MOZHU_PLUGIN_DIR/libs/sshkey.zsh $1 }

newtag() {
    # TODO: use virzz cli [newtag]
    local current_tag=$(git describe --abbrev=0 --tags) 
    echo Current Tag : $current_tag
    local part=(${(s:.:)current_tag}) 
    part[3]=$((part[3]+1)) 
    current_tag="${part[*]// /.}" 
    echo New Tag : $current_tag
    git tag -a $current_tag -m "Ver: $current_tag"
}

uniq_path(){
    # TODO: use virzz cli [uniq_path]
    export PATH=$(awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS;printf $1 }'<<<$PATH)
}

############################
# Custom Scripts
############################
uniq_path

. $MOZHU_PLUGIN_DIR/libs/virzz.zsh

source <(kubectl completion zsh)

############################
# alias
############################
alias vi='vim'
alias rm='trash'

alias ghcs='gh copilot suggest -t shell'
alias ghce='gh copilot explain'
# bin
alias grep="grep --color=auto"
alias sed='LANG=C LC_CTYPE=C sed'
# Clear
alias cls='clear'
alias clsmac='clearmac'
alias clsnpm='clearnpm'

alias javac="javac -J-Dfile.encoding=utf8"
alias service='brew services'
# Language
alias lgbk='export LANG=zh_CN.GBK'
alias lutf8='export LANG=en_US.UTF-8'
alias ldd='ld -e _start'
# github
alias git=hub
# php composer
alias composer='composer -vvv'
# Lua
alias luarocks='luarocks --lua-dir=/usr/local/opt/lua@5.1'

# Proxy
alias pc4='proxychains4'
alias stpc4='st /opt/homebrew/etc/proxychains.conf'

alias vv='source `pwd`/.venv/bin/activate'
alias venv='virtualenv .venv'

alias docker=podman
alias dcp='docker compose'
alias pub='flutter pub'

alias sdkmanager='sdkmanager --no_https --proxy=http --proxy_host=127.0.0.1 --proxy_port=1080'
alias sshk=sshkey
alias sshx='ssh -o StrictHostKeyChecking=no '
alias sshp='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no '

alias grep=ggrep

alias lego="lego -m $LEGO_ACCOUNT_EMAIL"
