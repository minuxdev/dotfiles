#!/bin/bash
#
set_aliases()
{
[[ ! $# -gt 0 ]] && (printf "No alias provided! Provide a valid alias.") ||
  sed -i " /ALIAS/ a alias $1 " ~/.zshrc
  source ~/.zshrc
}

set_aliases $1
