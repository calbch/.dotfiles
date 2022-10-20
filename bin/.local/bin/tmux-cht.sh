#!/usr/bin/env bash

languages=$(echo "typescript rust" | tr " " "\n")
core_utils=$(echo "find xargs sed" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils\n$utils" | fzf)

read -p "Query: " query

if echo "$languages" | grep -qs $selected; then
  tmux split-window -h bash -c "curl -s cht.sh/$selected/$(echo "$query" | tr " " "+") | less -r" 
else
  tmux split-window -h bash -c "curl -s cht.sh/$selected-$query | less -r" 
  curl cht.sh/$selected-$query
fi
