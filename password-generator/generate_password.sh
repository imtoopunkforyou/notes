#!/bin/bash

MESSAGE="Specify the password length in the range from 4 to 64"
MESSAGE_LENGHT=${#MESSAGE}
MESSAGE_FRAME=$(printf "%${MESSAGE_LENGHT}s" | tr ' ' "=")

MESSAGE_W_FRAME="$MESSAGE_FRAME"$'\n'"$MESSAGE"$'\n'"$MESSAGE_FRAME"

if [ -z "$1" ]; then
  echo "$MESSAGE_W_FRAME"
  exit 1
fi

PASSWORD_LENGTH=$1

if ! [[ "$PASSWORD_LENGTH" =~ ^[0-9]+$ ]]; then
  echo "$MESSAGE_W_FRAME"
  exit 1
fi

if [ "$PASSWORD_LENGTH" -lt 4 ] || [ "$PASSWORD_LENGTH" -gt 64 ]; then
  echo "$MESSAGE_W_FRAME"
  exit 1
fi

PASSWORD=$(tr -dc 'a-zA-Z' < /dev/urandom | head -c "$PASSWORD_LENGTH")
echo "$PASSWORD"
