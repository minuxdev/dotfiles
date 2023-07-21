#!/bin/bash
#
set_aliases()
{
  [[ ! $# -gt 0 ]] && 
    printf "No alias provided! Provide a valid alias." exit 5 ||

  echo $@

  for _alias in "$@"
  do 
    sed  " /ALIASES/ a alias ${_alias} " ~/.zshrc
  done
  source ~/.zshrc
}

set_aliases "$@" 
