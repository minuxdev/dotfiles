#!/bin/bash

tmux has-session -t fullstack 2 > /dev/null

if [[ $? != 0 ]]
then
  [[ ! -d $1 ]] && mkdir -p $HOME/projects/$1 
  tmux new-session -s fullstack -c $HOME/projects/$1 \; \
    rename-window 'back' \; \
    new-window \; \
    rename-window 'front' \; \
    new-window \; \
    rename-window 'console' \; \
    split-window -h \; \
    select-window -t 'back' \; \
else
  tmux attach -t fullstack
fi

