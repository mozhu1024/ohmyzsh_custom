is_integer() { [[ "$1" =~ ^[0-9,]+$ ]] }

if is_integer $1; then
    ts="${1//,/}"
    fm=$2
    if [ -z $fm ]; then
        fm="+%Y-%m-%d %H:%M:%S"
    fi
    date -r "$ts" "$fm"
else
    fms=(
        '%Y-%m-%d %H:%M:%S'
        '%Y-%m-%dT%H:%M:%S'
        '%Y/%m/%d %H:%M:%S'
        '%Y-%m-%d'
        '%Y/%m/%d'
    )
    for fm in $fms; do
        date -jf "$fm" "$1" >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            date -jf "$fm" "$1" +%s
            break
        fi
    done
fi