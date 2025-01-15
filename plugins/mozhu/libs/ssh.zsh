# ssh

if [[ $1 == j* ]]; then
  op item get GTJumpSEC --otp | pbcopy
fi

/usr/bin/ssh $@