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
    grep -r $word $1 --exclude-dir='.git'
    if [  $? = 0 ]; then
      echo "Commit message found with $word"
      exit 1
    fi
  fi

  grep -r $word . --exclude-dir='.git'
  if [ $? = 0 ]; then
    echo "File found with $word"
    exit 1
  fi

  files=`find . -name "*$word*"  -not -path "./.git/*"`
  if [ ! -z "$files" ]; then
    echo "Filename found with $word"
    exit 1
  fi
done
