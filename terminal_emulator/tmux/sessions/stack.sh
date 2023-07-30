#!/bin/bash

tmux has-session -t stack 2 > /dev/null

if [[ $? != 0 ]]
then
  [[ ! -d $1 ]] && mkdir -p $HOME/projects/$1
  tmux new-session -s stack -c $HOME/projects/$1 \; \
    rename-window 'code' \; \
    new-window \; \
    rename-window 'console' \; \
    select-window -t 'code' \; \
else 
  tmux attach -t stack
fi

