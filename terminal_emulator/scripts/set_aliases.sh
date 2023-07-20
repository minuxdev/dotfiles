#!/bin/bash
#
set_aliases()
{
  [[ ! $# -gt 0 ]] && (printf "No alias provided! Provide a valid alias." exit 5)
  printf "Setting the following aliases: ${argv[@]}"
  for _alias in ${argv[@]}
  do 
    sed -i " /ALIASES/ a alias $_alias " ~/.zshrc
  done
  source ~/.zshrc
}

set_aliases $argv[@]
