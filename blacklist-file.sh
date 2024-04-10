#!/usr/bin/bash

banlist=(
  "shit"
  "fuck"
  "bitch"
  "damn"
)

for word in "${banlist[@]}"
do
  if [ "$#" = 1 ]; then
    grep -r $word $1
    if [  $? = 0 ]; then
      exit 1 
    fi
  fi

  grep -r $word .
  if [ $? = 0 ]; then
    exit 1
  fi

  
done
