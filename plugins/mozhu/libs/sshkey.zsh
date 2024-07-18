local name=$1
local host=$2
if [[ -z $name ]]; then
    ssh-add -L
    return
fi
if [[ -z $host ]]; then
    ssh-add -L | grep -i $name
    return
fi
key=$(ssh-add -L | grep -i $name)
if [[ -z $key ]]; then
    echo "Not found key: $name"
    return
fi
skey=$(echo $key | awk '{print $2}')
# ssh-copy-id
SCRIPT=$(tr '\t\n' ' ' <<-EOF
    mkdir -p ~/.ssh;chmod 755 ~/.ssh;
    [ -f ~/.ssh/authorized_keys ] || touch ~/.ssh/authorized_keys;
    grep -q '$skey' ~/.ssh/authorized_keys || echo "\n$key\n" >> ~/.ssh/authorized_keys;
    chmod 600 ~/.ssh/authorized_keys;
EOF
)
SCRIPT=$(echo $SCRIPT | base64)
echo ssh $host "'echo $SCRIPT | base64 -d | sh'"
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no $host "echo $SCRIPT | base64 -d | sh"
res=$(ssh $host whoami)
echo "Copied and User: $res"