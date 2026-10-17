#!/bin/sh

SESSION="fullstack"

# Check if session exists
tmux has-session -t $SESSION 2>/dev/null

if [ $? -ne 0 ]; then
  # Start new session
  tmux new-session -d -s "$SESSION" -n "backend"

  # Create additional windows
  tmux new-window -t $SESSION:2 -n "frontend"
  tmux new-window -t $SESSION:3 -n "servers"
  tmux new-window -t $SESSION:4 -n "database"

  # Split window
  tmux split-window -h -d -t $SESSION:3

  # Start postgresql on database 'api'
  tmux send-keys -t $SESSION:4 "psql -U minuxdev -d api" C-m
fi

# Attach session
tmux attach-session -t $SESSION:1
