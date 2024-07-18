if [[ -n "$1" ]]; then
    echo "Set ALL_PROXY=$1 HTTP_PROXY=$1 HTTPS_PROXY=$1"
    export ALL_PROXY="$1"
    export HTTP_PROXY=$1
    export HTTPS_PROXY=$1
    unset NO_PROXY
elif [ ! -n "$ALL_PROXY" ]; then
    local proxyurl=http://127.0.0.1:1080
    echo "Set ALL_PROXY=$proxyurl HTTP_PROXY=$proxyurl HTTPS_PROXY=$proxyurl"
    export ALL_PROXY=$proxyurl
    export HTTP_PROXY=$proxyurl
    export HTTPS_PROXY=$proxyurl
    unset NO_PROXY
else
    echo "Unset ALL_PROXY,HTTP_PROXY,HTTPS_PROXY"
    unset ALL_PROXY
    unset HTTP_PROXY
    unset HTTPS_PROXY
    export NO_PROXY=1
fi